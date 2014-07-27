require 'rails_helper'
require 'block_score_api'
RSpec.describe BlockScoreAPI do
  describe "public methods" do
    subject { BlockScoreAPI.new(FactoryGirl.build(:user)) }

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
    
  end
end