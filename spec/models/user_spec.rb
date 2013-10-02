require 'spec_helper'

describe User do
  describe "validations" do
  	let!(:gabe) { FactoryGirl.create(:user) }

  	specify "user must have a name" do
  	  user = User.new
  	  user.save
  	  expect(user.errors_on(:name)).to include("can't be blank")
  	end

    describe "user email validations" do
    	it "should exist and be unique" do
    		duplicate_name_user = FactoryGirl.build(:user)
    		duplicate_name_user.save
  		  expect(duplicate_name_user.errors_on(:email)).to include("has already been taken")
    	end

      it "should be of the correct format" do
        bad_email_1 = FactoryGirl.build(:user, email: 'asdf')
        bad_email_2 = FactoryGirl.build(:user, email: 'email@somestring')
        good_email = FactoryGirl.build(:user, email: 'eMAIl@doma1n.com')
        expect(bad_email_1).to be_invalid
        expect(bad_email_2).to be_invalid
        expect(good_email).to be_valid
      end
    end

  	specify "users' passwords.length should be > 5" do
  		bad_pw_user = FactoryGirl.build(:user, password: '12345')
  		expect(bad_pw_user.errors_on(:password)).to include("is too short (minimum is 6 characters)")
  	end

    specify "users' password and password_confirmation should be equal" do
      bad_pw_user = FactoryGirl.build(:user, password: 'abcdef', password_confirmation: 'qwerty')
      expect(bad_pw_user.errors_on(:password_confirmation)).to include("doesn't match Password")
    end
   
  end

it { should respond_to(:password_digest) }
it { should respond_to(:password) }
it { should respond_to(:password_confirmation) }

it { should respond_to(:authenticate) }

describe "#authenticate" do 
  before do
    FactoryGirl.create(:user, email: 'g@h.com', password: '123456', password_confirmation: '123456')
  end
  
  let(:user) { User.find_by_email('g@h.com') }
  
  describe "with valid password" do
    specify do
      expect(user.authenticate('123456')).to eq(user)
    end
  end

  describe "with invalid password" do
    specify do
      expect(user.authenticate('invalid')).to be_false
    end
  end
end


end
