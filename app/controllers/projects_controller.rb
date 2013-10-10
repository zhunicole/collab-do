class ProjectsController < ApplicationController

	before_filter :authenticate_user!

	def new
		@project = Project.new
		@title = 'Create project'
	end

	def create
		@project = Project.new(project_params.merge(creator_id: current_user.id))		

		if @project.save then 
			current_user.projects << @project
			redirect_to project_path(@project.id)
		else
			render 'new'
		end

	end

	def show
		@project = Project.find params[:id]
		@title = 'Show Project'
		@collabers = @project.users
		
	end

	def edit

		@project = Project.find params[:id]
		if current_user.id != @project.creator_id then redirect_to unacceptable_path end
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

	def collab
		@project = Project.find params[:id]
		current_user.projects << @project unless current_user.projects.include?(@project)
		redirect_to project_path(@project)
	end

	def quit
		@project = Project.find params[:id]
		current_user.projects.destroy(@project)
		redirect_to project_path(@project)
	end


	def ongoing_projects
		@projects = Project.where(ongoing: true)

	end

	def project_params
		params.require(:project).permit(:name, :description, :creator_id,
			:location, :start_time, :end_time, :avatar)
	end
end
