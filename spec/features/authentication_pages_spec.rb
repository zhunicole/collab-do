require 'feature_spec_helper'

describe 'Authentication' do
  let(:user) { FactoryGirl.create(:user) }

  describe "Signing In" do
    subject { page }
    before { visit signin_path }

    describe "signin page" do
      it { should have_text('Sign In') }
    end

    describe "with valid information" do
  		before { sign_in user }

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
        it { should have_text('invalid email and or invalid password')}
      end

      describe 'invalid password' do
        before do
          fill_in "Email", :with => user.email
          fill_in "Password", :with => 'invalid'
          click_button "Sign in"
        end
        it { should have_text('invalid email and or invalid password')}
      end
    end
  end

  describe "Signing Out" do
    context 'when signed in' do
      before do
        sign_in user
      end

      it 'lets the user sign out' do
        visit '/home'
        # click_on 'Sign out'
        # expect(page).to have_text 'Signed out.'
      end
    end
  end
end