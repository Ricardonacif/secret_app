class BlockScoreAPI

  def initialize(user)
    @client = BlockScore::Client.new(Rails.application.secrets.block_score_key, version = 3)
    @user_attributes = normalize_user_attributes(user)
  end

  def new_user_valid?
    verification_response['status'] == 'valid'
  end

  def new_user_identification
    verification_response['id']
  end

  protected

  def verification_response
    @verification_response ||= @client.verification.create(@user_attributes)
  end

  def normalize_user_attributes(user)
    {
      date_of_birth: user.date_of_birth.to_s,
      identification: {
        ssn: user.ssn
      },
      name: {
        first: user.first_name,
        middle: user.middle_name,
        last:  user.last_name
      },
      address: {
        street1:  user.street_1,
        street2:  user.street_2,
        city:  user.city,
        state:  user.state,
        postal_code:  user.postal_code,
        country_code:  user.country_code
      }
    }
  end

end