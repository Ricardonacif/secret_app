require 'block_score_api' #autoload libs files is not recommended
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise  :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  validates_presence_of :date_of_birth, :password, :email, :ssn, :first_name, :last_name, :street_1,
     :city, :state, :postal_code, :country_code

  validate :check_if_valid_at_blockscore


  def check_if_valid_at_blockscore
    return unless errors.blank?
    errors.add(:invalid_user, "personal information is invalid according to BlockScore") unless blockscore_client.new_user_valid?
  end


  protected

  def blockscore_client
    @blockscore_client ||= BlockScoreAPI.new(self)
  end

end
