class SessionsController < ApplicationController

	def new  #new session created when user clicks sign in
		# set currnet user... if sign in is success then
		
	end

	def create
		user = User.find_by_email(params[:session][:email])
		
		if user
			session[:current_user] = user
			redirect_to '/home'
		else
			flash[:errors] = "invalid email"
			render 'new' 
		end
	end

	def destroy
	end


end
