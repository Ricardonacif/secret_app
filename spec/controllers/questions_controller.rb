require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "#index" do 
    context "when logged out" do 
      it "should redirect to sign in" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    context "when logged in" do 
      login_user_before_each
      
      it "should render the index with 5 questions" do
        get :index
        expect(response).to render_template("index")
        expect(assigns(:questions)).to be_a(Array)
        expect(assigns(:questions).size).to be_equal(5)
      end
    end

  end
end
