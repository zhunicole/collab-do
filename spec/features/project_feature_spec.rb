require 'feature_spec_helper'

describe 'Project actions' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project, creator_id: user.id)}

  before(:each) do
    login_as(user, :scope => :user)
    user.projects << project
    visit '/home'
  end


	describe  "Creating new project" do
		it 'lets the user create a new project' do
			click_on 'Create Project'			
			expect(page).to have_text 'new project'
			fill_in 'Name', :with => 'Learn to dance'
			fill_in 'Description', :with => 'I need a dancing partner'
			fill_in 'Location', :with => 'loc'
      fill_in 'Start time', :with => '2020-02-02 16:20:12'
      fill_in 'End time', :with => '2020-04-01 16:20:12'
      click_on 'Create project'
			expect(page).to have_content('Learn to dance')
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
      visit "http://localhost:3000/projects/#{project.id.to_s}/edit"
      expect(page).to have_text 'The change you wanted was rejected.'
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

  describe "Collabing on projects" do
    let!(:otherUser) { FactoryGirl.create(:user, email: 'a@a.com') }
    let!(:otherProject) { FactoryGirl.create(:project, id: 20, creator_id: otherUser.id) }

    before(:each) do
      click_on 'Sign Out'
      login_as(user, :scope => :user) 
      otherUser.projects << otherProject
      visit "http://localhost:3000/projects/20"
      click_link 'Join project'
    end


    it 'lets users join/delete projects, views corresponding' do
      expect(page).to have_text 'Quit project'
    end

    it 'displays collabers in project description' do
      user.projects << otherProject
      # save_and_open_page
      # within('.collaber_class') do
        expect(page).to have_text(user.name)
      # end
    end
  end
end
