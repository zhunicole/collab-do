require 'spec_helper'

describe "Authentication" do

  subject { page }
  before { visit signin_path }
  let(:user) { FactoryGirl.create(:user) }


  describe "signin page" do
    it { should have_text('Sign In') }
  end

  describe "with valid information" do
		before do
			fill_in "Email", :with => user.email 
			fill_in "session_password", :with => user.password 
			click_button "Sign in"
		end

		it { should have_text(user.name) }
    # it { should have_link('Profile',     href: user_path(user)) }
    # it { should have_link('Sign out',    href: signout_path) }
    # it { should_not have_link('Sign in', href: signin_path) }
  end
  
  describe "with invalid information" do
  	describe 'invalid email' do
      before do
        fill_in "Email", :with => 'someInvalidEmail'
        click_button "Sign in"
      end
      it { should have_text('invalid email')}
    end

    describe 'invalid password' do
      before do
        fill_in "Email", :with => user.email
        fill_in "session_password", :with => 'invalid'
        click_button "Sign in"
      end
      it { should have_text('invalid password')}
    end
  end
end