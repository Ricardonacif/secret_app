class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise  :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  validates_presence_of :date_of_birth, :password, :email, :ssn, :first_name, :last_name, :street_1,
     :city, :state, :postal_code, :country_code

  

  
  protected

end
