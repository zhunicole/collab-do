require 'spec_helper'

describe User do
	describe '#name' do
	  
		let(:user) { FactoryGirl.create(:user, first_name: 'Nicole', last_name: 'Zhu') }
	  it "returns the user's first and last name" do
	  	expect(user.name).to eq('Nicole Zhu')
	  end
	end
end