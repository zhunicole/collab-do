require 'feature_spec_helper'

describe 'Project actions' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project, :creator => user.id)}

  before(:each) do
    login_as(user, :scope => :user)
    visit '/'
  end
	
	describe  "Creating new project" do
		it 'lets the user create a new project' do
			click_on 'Create new project'			
			expect(page).to have_text 'new project'
			fill_in 'Name', :with => 'Learn to dance'
			fill_in 'Description', :with => 'I need a dancing partner'
			fill_in 'Location', :with => 'loc'
      fill_in 'Start time', :with => '2010-02-02 16:20:12'
      fill_in 'End time', :with => '2010-04-01 16:20:12'
      click_on 'Create project'
			expect(page).to have_content('Learn to dance')
		end


    pending 'doesnt let user specify wrong dates' do
    end

  end


  describe "Viewing an existing project" do
  	context 'for public and user' do
  		it 'shows project details' do
  			click_on project.name
  			expect(page).to have_text project.description
  		end
  	end
  end

  describe "Editing an existing project" do
  	let(:unauthoUser) { FactoryGirl.create(:user, :email => 'z@z.com') }
   
    before(:each) do
      click_on project.name
      click_on 'Edit project'
    end

    it 'doesnt permit noncreators to edit projects' do
      click_on 'Sign Out'
      login_as(unauthoUser, :scope => :user) 
      visit "http://localhost:3000/projects/edit/" + project.id.to_s
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

  describe "Deleting an existing project" do
    
    before(:each) do
      click_on project.name
      click_on 'Delete project'
    end
    it 'displays default info and saves new changes' do
      expect(page).to_not have_text 'Project summary and descrip'
    end

  end
end
