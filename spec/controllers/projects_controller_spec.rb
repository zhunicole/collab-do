require 'spec_helper'

describe ProjectsController do
	let!(:user) { FactoryGirl.create(:user) }
	before(:each) do
		sign_in user
	end

	describe "POST create" do
		let(:do_request) { post :create, project: FactoryGirl.attributes_for(:project, creator_id: user.id) }		
		
		describe "creates new project" do
			it "saves to db" do
				expect(Project.count).to eq(0)
				do_request
				expect(Project.count).to eq(1)
				expect(Project.first.name).to eq('Project title')
			end

			it ' now has user as collaborator' do
				do_request
				expect(user.projects.length).to eq 1
			end
		end
		
	end

	describe "PUT update" do

		describe "PUT 'update/:id'" do
			before do 
				@project = FactoryGirl.create(:project)
			end

		  it "allows a project to be updated" do
		    @attr = { :name => "new name", :description => "new description" }
		    put :update, :id => @project.id, :project => @attr
		    @project.reload
		    @project.name.should == @attr[:name]
		    @project.description.should == @attr[:description] 
		  end
		end
	end

	describe '#collab' do
		# has user already
		let(:project) { FactoryGirl.create(:project, id: user.id) }
		let(:do_request) { get :collab, id: project.id }		

		it 'lets user join (collaborate) on a project' do
			expect(project.users.length).to eq 0
			do_request
			project.reload
			expect(project.users.length).to eq 1
		end

		it 'doesnt let user collab >1 time' do
			expect(project.users.length).to eq 0
			do_request
			project.reload
			expect(project.users.length).to eq 1
			do_request
			project.reload
			expect(project.users.length).to eq 1
		end

	end
end
