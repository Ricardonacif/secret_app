module ControllerMacros
  def login_user_before_each
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirm!
      sign_in user
    end
  end
end


RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, :type => :controller
end
