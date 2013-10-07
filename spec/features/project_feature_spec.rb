require 'feature_spec_helper'

describe 'Project actions' do


  before(:each) do
      sign_in FactoryGirl.create(:user)
  end
	
	let(:project) { FactoryGirl.create(:project, :user_id => user.id)}
	
	pending  "Creating new project" do
		it 'lets the user create a new project' do
			click_on 'Create new project'			
			expect(page).to have_text 'new project'
			fill_in 'Name', :with => 'Learn to dance'
			fill_in 'Description', :with => 'I need a dancing partner'
			click_on 'Create project'
			expect(page).to have_content('Learn to dance')
		end
  end

  pending "Viewing an existing project" do
  	context 'for public and user' do
  		it 'shows project details' do
  			click_on project.name
  			expect(page).to have_text project.description
  		end
  	end
  end

  pending "Editing an existing project" do
  	
    before(:each) do
      click_on project.name
      click_on 'Edit project'
    end
		it 'displays default info and saves new changes' do
      fill_in 'Name', :with => 'New Name for Proj'
      click_on 'Save'
      expect(page).to have_text 'New Name for Proj'
      expect(page).to have_text 'Project summary and descrip'
  	end

    it 'refreshes page if edit is invalid' do
      fill_in 'Name', :with => ''
      click_on 'Save'
      expect(page).to have_content "Namecan't be blank"
    end
  end

  pending "Deleting an existing project" do
    
    before(:each) do
      click_on project.name
      click_on 'Delete project'
    end
    it 'displays default info and saves new changes' do
      expect(page).to_not have_text 'Project summary and descrip'
    end

  end
end
