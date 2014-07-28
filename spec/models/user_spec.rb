require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do

    subject { FactoryGirl.build(:user) }
    
    [:date_of_birth, :password, :email, :ssn, :first_name, :last_name, :street_1,
     :city, :state, :postal_code, :country_code].each do |attribute|

      it "should not be valid without #{attribute}" do 
        subject.send("#{attribute}=", '')
        expect(subject).not_to be_valid
      end

    end

    #according to the BlockScore API documentation, for testing pourpose,
    #an invalid user should have his SSN ending with 0000
    
    it "should be valid if BlockScore API classifies it as invalid" do
      subject.ssn = '0000'
      subject.save
      expect(subject).to be_valid
    end

    #according to the BlockScore API documentation, for testing pourpose,
    #an invalid user should have his SSN ending with 0001

    it "should not be valid if BlockScore API classifies it as invalid" do
      subject.ssn = '0001'
      subject.save
      expect(subject).not_to be_valid
    end

  end
  describe "BlockScore API ID" do

    subject { FactoryGirl.build(:user) }
    
    it "should set the BlockScore ID when saving" do 
      expect(subject.blockscore_id).to be_nil
      subject.save
      expect(subject.blockscore_id).to be_present
    end

  end
end