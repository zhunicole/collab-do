require 'spec_helper'

describe AdminController do
	let!(:admin) { FactoryGirl.create(:admin) }
	let!(:user) { FactoryGirl.create(:user) }
	let!(:project) {FactoryGirl.create(:project, creator_id: user.id)}
	
	before(:each) do
		sign_in admin
	end

	
	describe "#remove_user" do
		let(:do_request) {delete :remove_user, id: user.id }		

		describe "deletes user account" do
			it "removes the user from db" do
				expect(User.count).to eq(2)
				do_request
				expect(User.count).to eq(1)
			end

			it 'removes his projects' do
				expect(Project.count).to eq(1)
				do_request
				expect(Project.count).to eq(0)
			end
		end
		
	end

	describe "#toggle_feature_user" do
		let(:do_request) {patch :toggle_feature_user, id: user.id}

		it 'toggles user feature attr to true and false' do
			expect(User.featured.count).to eq(0)
			do_request
			expect(User.featured.count).to eq(1) 
		end
	end


	describe "#toggle_feature_project" do
		let(:do_request) {patch :toggle_feature_project, id: project.id}

		it 'toggles project feature attr to true and false' do
			expect(Project.featured.count).to eq(0)
			do_request
			expect(Project.featured.count).to eq(1) 
		end
	end


	pending "#block_user" do


	end

	pending '#remove_user' do
	
	end

	# describe 'Actions when project is not active' do
	# 	let(:project) { 
	# 		p = FactoryGirl.build(:project, id: user.id,
	# 		start_time: '2000-02-02 16:20:12', end_time: '2000-04-04 16:20:12')
	# 		p.save(validate: false) 
	# 		p 
	# 	}
	# 	let(:do_collab) { get :collab, id: project.id }	


	# 	it 'doesnt let creator edit or delete' do
	# 		@attr = { :name => "new name" }
	#     put :update, :id => project.id, :project => @attr
	#     project.reload
	#     project.name.should_not == @attr[:name]			
	# 	end

	# 	it 'doesnt let other users join or quit' do
	# 		do_collab
	# 		project.reload
	# 		expect(project.users.length).to eq 0
	# 	end
	# end
end
