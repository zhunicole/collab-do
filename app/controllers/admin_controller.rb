class AdminController < ApplicationController
	before_action :authenticate_user!   
	before_action do
		if !current_user.admin then
			flash[:notice] = 'You are not an administrator'
			redirect_to '/home'
		end
	end

	def index
		
  	@unapproved_users = User.find_all_by_approved(false)
		@unapproved_projects = Project.find_all_by_approved(false)
		@approved_users = User.order("first_name ASC, id ASC") - @unapproved_users
		@approved_projects = Project.order("created_at DESC, id ASC")	- @unapproved_projects
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

	def approve_user
		@user = User.find(params[:id])
		@user.update_attribute(:approved, true)
		redirect_to '/admin'

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
		@project = Project.find(params[:id])
		@project.update_attribute(:approved, true)
		redirect_to :back
		#TODO: set servicetwo pane to active

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
