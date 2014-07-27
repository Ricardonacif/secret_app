require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do
  describe "#index" do 
    context "when logged out" do 
      it "should redirect to sign in" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    context "when logged in" do 
      login_user_before_each
      
      
      it "should redirect to the secret if your score is above 80" do
        User.any_instance.stub(:get_score_on_question_set_answers).and_return(90)
        post :create, answers: {"1"=>"4", "2"=>"5", "3"=>"1", "4"=>"2", "5"=>"5"}
        expect(response).to redirect_to(secret_path)
      end

      it "should be redirect to the questions page if your score is bellow 80" do
        User.any_instance.stub(:get_score_on_question_set_answers).and_return(60)
        post :create, answers: {"1"=>"4", "2"=>"5", "3"=>"1", "4"=>"2", "5"=>"5"}
        expect(response).to redirect_to(questions_path)
      end
    end

  end
end
