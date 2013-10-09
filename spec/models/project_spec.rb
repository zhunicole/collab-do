require 'spec_helper'

describe Project do
  describe "validations" do
   
  end

it { should respond_to(:name) }
it { should respond_to(:description) }
it { should respond_to(:users) }


	describe '#creator' do
		let!(:user) { FactoryGirl.create(:user) }
  	let!(:project) { FactoryGirl.create(:project, :creator_id => user.id)}


		it 'should return the user that created project' do

			expect(project.creator).to eq(user)

		end
	end
end
