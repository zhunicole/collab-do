class AdminController < ApplicationController
	before_action :authenticate_user!   
	before_action do
		if !current_user.admin then
			redirect_to new_user_session_path 
		end
	end

	def index
		@users = User.all conditions: (current_user ? ["id != ?", current_user.id] : [])
		@projects = Project.all
	end

	# USER

	def remove_user
		@user = User.find(params[:id])
		Project.where(creator_id: @user.id).destroy_all
		User.destroy(@user)
		# todo send deleted user an email notif
		redirect_to '/admin'
	end

	def block_user

	end

	def unblock_user

	end

	def feature_user

	end

	def make_admin
		@user = User.find(params[:id])
		if @user.update_attribute(:admin, true)
			redirect_to '/admin'
		else 
			render params[:id]
		end
	end

	# PROJECT

	def approve_project
	end

	def remove_project
		@project = Project.find(params[:id])
		Project.destroy(@project)
		# todo check if this affects User.projects
		redirect_to '/admin'
	end

	def feature_project
	end

end
