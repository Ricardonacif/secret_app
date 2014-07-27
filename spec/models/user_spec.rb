require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do 
    def valid_attributes

    end
    [:date_of_birth, :password, :email, :ssn, :first_name, :last_name, :street_1,
     :city, :state, :postal_code, :country_code].each do |attribute|
      it "shouldn't be valid without #{attribute}" do 
        user = FactoryGirl.build(:user, attribute => "")
        expect(user).not_to be_valid
      end

    end
  end
end