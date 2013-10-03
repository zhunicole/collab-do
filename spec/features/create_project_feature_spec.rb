require 'feature_spec_helper'

describe 'new project' do
	let(:user) { FactoryGirl.create(:user) }

	describe "Creating new project" do
		before { sign_in user }

		it 'lets the user create a new project' do
			visit '/home'
			click_on 'Create new project'
			expect(page).to have_text 'new project'

			fill_in 'Name', :with => 'Learn to dance'
			fill_in 'Description', :with => 'I need a dancing partner'
			click_on 'Create project'
			
			expect(page).to have_content('Learn to dance')
		end
  end
end
