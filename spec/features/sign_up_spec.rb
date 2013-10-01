require 'spec_helper'

describe "the signin process" do
  before :each do
  end

  it "signs me in" do
    visit '/'
    click_on 'Sign Up'
  	fill_in 'Name', :with => 'Nicole'
  	fill_in 'Email', :with => 'user@example.com'
  	fill_in 'Password', :with => 'password'
    click_on 'Sign Up'
    
    expect(page.status_code).to eq(200)
    expect(page.body).to include('Welcome, Nicole!')

  end
end