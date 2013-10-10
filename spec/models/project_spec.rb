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

	describe '#valid_times' do
		it 'doesnt let user misorder the project dates' do
			proj = FactoryGirl.build(:project, start_time: DateTime.now, 
				end_time: DateTime.now)
			proj.should_not be_valid
		end
	end
end
