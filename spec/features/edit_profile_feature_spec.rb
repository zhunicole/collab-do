require 'feature_spec_helper'

describe 'Editing user profile' do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
    visit '/'
    click_on 'My profile'
    click_on 'Edit profile'
  end

	it 'should require first name' do
		fill_in 'user_first_name', :with => ''
		click_on 'Update'
		within('.user_first_name') do 
			expect(page).to have_text "First namecan't be blank"
		end
	end
	
end
