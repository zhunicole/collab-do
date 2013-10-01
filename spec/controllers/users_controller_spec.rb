require 'spec_helper'

describe UsersController do
	describe "POST create" do
		let(:do_request) { post :create, user: FactoryGirl.attributes_for(:user, name: 'Gabe') }
		
		it "Saves the new user to the db" do
			expect(User.count).to eq(0)
			do_request
			expect(User.count).to eq(1)
			expect(User.first.name).to eq('Gabe')
		end

		it "assigns the created user to the session" do
			do_request
			expect(session[:current_user].name).to eq('Gabe')
		end

		it 'redirects to user\'s home page' do 
			do_request
			expect(response).to redirect_to('/home')
		end
	end

end