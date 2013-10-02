class UsersController < ApplicationController



	def new
		@user = User.new
	end

	def create
		current_user = User.new(user_params)
		current_user.save
		session[:current_user] = current_user
		redirect_to '/home'
	end

	def home
		@current_user = session[:current_user]
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
