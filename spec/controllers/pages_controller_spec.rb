require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "home page" do 
    
    it "should be accessible without signing in" do
      get :home
      expect(response).to render_template("home")
    end

  end

  describe "secret page" do
    context "unauthenticated user" do 
      it "should redirect to sign in" do
        get :secret
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    context "logged in user" do 
      login_user_before_each
      
      it "should access the secret if signed in" do
        
        get :secret
        expect(response).to render_template("secret")
      end
    end

  end
end
