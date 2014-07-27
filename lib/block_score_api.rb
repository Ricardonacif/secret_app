class BlockScoreAPI

  def initialize(user)
    @client = BlockScore::Client.new(Rails.application.secrets.block_score_key, version = 3)
    @user = user
  end

  def new_user_valid?
    verification_response['status'] == 'valid'
  end

  def new_user_identification
    verification_response['id']
  end

  def retrieve_questions
    response = if @user.blockscore_last_question_set_id.present?
      @client.question_set.retrieve(
        question_set_id = @user.blockscore_last_question_set_id
      )
    else
      get_new_set_of_questions
    end
    response['questions']
  end

  def get_answers_score(answer)
    return nil unless @user.blockscore_last_question_set_id.present?
    @client.question_set.score(@user.blockscore_last_question_set_id,answer)['score']
  end

  protected

  def get_new_set_of_questions
    set = @client.question_set.create(
      verification_id = @user.blockscore_id
    )
    @user.update_attribute(:blockscore_last_question_set_id, set['id'] )
    set
  end

  def verification_response
    @verification_response ||= @client.verification.create(normalized_user_attributes)
  end

  def normalized_user_attributes
    {
      date_of_birth: @user.date_of_birth.to_s,
      identification: {
        ssn: @user.ssn
      },
      name: {
        first: @user.first_name,
        middle: @user.middle_name,
        last:  @user.last_name
      },
      address: {
        street1:  @user.street_1,
        street2:  @user.street_2,
        city:  @user.city,
        state:  @user.state,
        postal_code:  @user.postal_code,
        country_code:  @user.country_code
      }
    }
  end

end