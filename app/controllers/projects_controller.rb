class ProjectsController < ApplicationController

	before_filter :authenticate_user!

	def new
		@project = Project.new
		@title = 'Create project'
	end

	def create
		@project = Project.new(project_params.merge(creator: current_user.id))		

		if @project.save then 
			redirect_to '/'
			# TODO should redirect to project
		else
			render 'new'
		end

	end

	def show
		@project = Project.find params[:id]
		@title = 'Show Project'
		@creator =  User.find(@project.creator)
	end

	def edit

		@project = Project.find params[:id]
		if current_user.id != @project.creator then redirect_to unacceptable_path end
		@title = 'Edit Project'
	end

	def update
		@project = Project.find params[:id]
		if @project.update_attributes(project_params) then
			redirect_to project_path
		else 
			render 'edit'
		end
	end

	def destroy
		(Project.find params[:id]).destroy
		redirect_to '/'
	end

	def project_params
		params.require(:project).permit(:name, :description, :creator, 
			:location, :start_time, :end_time, :avatar)
	end
end
