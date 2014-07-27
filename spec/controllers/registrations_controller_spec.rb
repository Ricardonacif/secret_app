require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do
  describe "#create" do 
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      User.destroy_all
      @user = FactoryGirl.build(:user)
    end

    it "should registrate a new unconfirmed user" do
      user_attributes = @user.attributes
      user_attributes['password'] = 'passwordpass'
      user_attributes['password_confirmation'] = 'passwordpass'

      xhr :post, :create, user: user_attributes
      response_hash = JSON.parse(response.body)

      expect(response_hash['success']).to be_equal(true)
      expect(User.last).not_to be_confirmed
    end

    it "should return error messages if user isn't valid" do 
      user_attributes = @user.attributes
      user_attributes['ssn'] = ''

      xhr :post, :create, user: user_attributes
      response_hash = JSON.parse(response.body)

      expect(response_hash['success']).to be_equal(false)
      expect(response_hash['errors']).to be_present
      expect(User.count).to be_equal(0)
    end
  end

end