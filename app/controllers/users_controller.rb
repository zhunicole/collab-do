class UsersController < ApplicationController



	def new
		@user = User.new
	end

	def create
		current_user = User.new(user_params)
		if current_user.save
			session[:user_id] = current_user.id
			redirect_to '/home'
		else 
			@user = current_user
			render 'new'
		end
		
	end

	def home
		@current_user = User.find(session[:user_id])
		@projects = @current_user.projects
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
