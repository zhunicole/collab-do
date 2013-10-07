require 'feature_spec_helper'

describe 'Authentication' do
  let(:user) { FactoryGirl.create(:user) }

  describe "Signing In" do
    subject { page }
    before { visit signin_path }

    describe "signin page" do
      it { should have_text('Sign in') }
    end

    describe "with valid information" do
  		before { sign_in user }

  		it { should have_text(user.name) }
      # it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign Out',    href: 'signout') }
      it { should_not have_link('Sign In', href: 'signin') }
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
        visit '/home'
        click_on 'Sign Out'
      end

      it 'lets the user sign out' do
        expect(page).to have_link 'Sign up'
        page.should_not have_link 'Sign out'
      end
    end
  end
end