require 'spec_helper'

describe User do
  describe "validations" do
  	let!(:gabe) { FactoryGirl.create(:user) }

  	specify "users' emails should be unique" do
  		other_gabe = FactoryGirl.build(:user)
  		other_gabe.save
		expect(other_gabe.errors_on(:email)).to include("has already been taken")
  	end

  	specify "users' passwords.length should be > 5" do
  		gabeFail = FactoryGirl.build(:user, password: '12345')
  		expect(gabeFail.errors_on(:password)).to include("is too short (minimum is 6 characters)")

  	end

  end


end
