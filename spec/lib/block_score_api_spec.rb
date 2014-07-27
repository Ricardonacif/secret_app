require 'rails_helper'
require 'block_score_api'
RSpec.describe BlockScoreAPI do
  describe "public methods" do
    subject { BlockScoreAPI.new(FactoryGirl.create(:user)) }

    context "new_user_valid?" do 
      it "should return true when the user is valid on BlockScore" do
        expect(subject.new_user_valid?).to be_equal(true)
      end

      it "should return false when the user isn't valid on BlockScore" do
        client = BlockScoreAPI.new(FactoryGirl.build(:user, ssn: '0001'))
        expect(client.new_user_valid?).to be_equal(false)
      end

    end
    
    context "new_user_identification" do 
      it 'should return an identification number' do
        expect(subject.new_user_identification).to be_a(String)
      end
    end

    context 'retrieve_questions' do 
      it "should retrieve an array of questions" do 
        expect(subject.retrieve_questions).to be_a(Array)
      end
    end
    
    context 'get_answers_score' do
      it 'should get the score when submiting answers' do 
        subject.retrieve_questions
        answers = [
          { question_id: 1, answer_id: 5 },
          { question_id: 2, answer_id: 5 },
          { question_id: 3, answer_id: 5 },
          { question_id: 4, answer_id: 5 },
          { question_id: 5, answer_id: 5 }
        ]

        expect(subject.get_answers_score(answers)).to be_a(Float)
      end
    end
  end
end