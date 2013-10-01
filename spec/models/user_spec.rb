require 'spec_helper'

describe User do
  describe "validations" do

  	specify "users' emails should be unique" do
  		gabe = User.create name: 'Gabe', email: 'gabe@foo.com', password: '123456'
  		other_gabe = User.new name: 'Gabe', email: 'gabe@foo.com', password: '123456'
  		other_gabe.save
		expect(other_gabe.errors_on(:email)).to include("has already been taken")
  	end

  	specify "users' passwords.length should be > 5" do

  	end

  end


end
