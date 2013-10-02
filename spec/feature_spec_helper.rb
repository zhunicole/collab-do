require 'spec_helper'

def sign_in user
	visit '/'
	click_on 'Sign In'
	fill_in 'Email', with: user.email
	fill_in 'session_password', with: '123456'
	click_on 'Sign in'

end