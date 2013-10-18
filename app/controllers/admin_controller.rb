class AdminController < ApplicationController

	def index
		@users = User.all conditions: (current_user ? ["id != ?", current_user.id] : [])
		@projects = Project.all

	end

	def remove_user
		@user = User.find(params[:id])
		Project.where(creator_id: @user.id).destroy_all
		User.destroy(@user)
		# todo send deleted user an email notif

		redirect_to '/admin'
	end

end
