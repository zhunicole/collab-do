class AdminController < ApplicationController
	# before_action :authenticate_user!   
	# before_action do
	# 	if !current_user.admin then
	# 		flash[:notice] = 'You are not an administrator'
	# 		redirect_to '/home'
	# 	end
	# end

	def index
		@users = User.order("first_name ASC, id ASC") 
		@projects = Project.order("created_at DESC, id ASC")
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

	def toggle_feature_user
		@user = User.find(params[:id])
		if @user.featured
			@user.update_attribute(:featured, false)
		else
			@user.update_attribute(:featured, true)
		end
		redirect_to '/admin'
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
		redirect_to '/admin'
	end

	def toggle_feature_project
		@project = Project.find(params[:id])
		if @project.featured
			@project.update_attribute(:featured, false)
		else
			@project.update_attribute(:featured, true)
		end
		redirect_to '/admin'
	end

end
