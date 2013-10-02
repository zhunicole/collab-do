require 'spec_helper'

describe "the signup process" do
  before :each do
    visit '/'
    click_on 'Sign Up'
  end

  it "signs me up" do
  	fill_in 'Name', :with => 'Nicole'
    fill_in 'Email', :with => 'user@example.com'
  	fill_in 'Password', :with => 'password'
    click_on 'Sign Up'
    
    expect(page.status_code).to eq(200)
    expect(page.body).to include('Welcome, Nicole!')
  end

  it "it gives error message with bad signup" do
    fill_in 'Name', :with => 'username'
    fill_in 'Email', :with => 'good@email.com'
    fill_in 'Password', :with => 'badpw'

    click_on 'Sign Up'
    expect(page.body).to include('Password is too short')
  end
end
