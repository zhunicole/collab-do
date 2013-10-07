class SessionsController < ApplicationController

	def new  #new session created when user clicks sign in
		# set currnet user... if sign in is success then
		
	end

	def create
		user = User.find_by_email(params[:session][:email])
		
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to '/home'
		else
			flash[:errors] = "invalid email and or invalid password"

			render 'new' 
		end
	end

	def destroy
		# sign up 
		session[:user_id] = nil
		redirect_to ''
	end


end
