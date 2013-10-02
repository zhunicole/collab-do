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

    pending "user's passwords should pass all validations" do
        expect(1==2).to be_true
    end
  end


end
