require 'spec_helper'

def sign_in user
	visit '/'
	click_on 'Sign in'
	fill_in 'Email', with: user.email
	fill_in 'Password', with: '123456'
	click_on 'Sign in'
end

def sign_up user
	visit '/'
	click_on 'Sign up'
	fill_in 'Name', with: user.name 
	fill_in 'Email', with: user.email
	fill_in 'Password', with: '123456'
	fill_in 'Password confirmation', with: '123456'
	click_on 'Sign up'
end