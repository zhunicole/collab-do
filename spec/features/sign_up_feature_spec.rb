require 'spec_helper'

# describe "the signup process" do
#   before :each do
#     visit '/'
#     click_link 'Sign Up'
#   end

#   it "signs me up, but not approved" do
#     fill_in 'Email', :with => 'user@example.com'
#   	fill_in 'Password', :with => 'secretpass', :match => :prefer_exact
#     fill_in 'Password confirmation', :with => 'secretpass'
#     click_button 'Sign up'
    
#     # expect(page.status_code).to eq(200)
#     expect(page.body).to include('You have signed up successfully but your account has not been approved')
#   end

#   it "it gives error message with bad signup" do
#     fill_in 'Email', :with => 'good@email.com'
#     fill_in 'Password', :with => 'badpw', :match => :prefer_exact
#     fill_in 'Password confirmation', :with => 'badpw'

#     click_button 'Sign up'
#     expect(page.body).to include('is too short')
#   end
# end
