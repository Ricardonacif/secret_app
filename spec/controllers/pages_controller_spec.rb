require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "#home" do 
    
    it "should be accessible without signing in" do
      get :home
      expect(response).to render_template("home")
    end

  end

  describe "#secret" do
    context "when logged out" do 
      it "should redirect to sign in" do
        get :secret
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    context "when logged in" do 
      login_user_before_each
      
      it "should not access the secret if the user didn't answered to the security questions" do
        
        get :secret
        expect(response).to redirect_to(questions_path)
      end

      it "should access the secret if the user already answered the security questions" do
        user = User.last
        user.update_attribute(:blockscore_question_vefiried, true)
        get :secret
        expect(response).to render_template('secret')
      end
    end

  end
end
