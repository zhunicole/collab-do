class ProjectsController < ApplicationController

	def new
		@project = Project.new
		@title = 'Create project'
	end

	def create
		@project = Project.new(project_params.merge(user_id: current_user.id))		

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
	end

	def edit
		@project = Project.find params[:id]
		@title = 'Edit Project'
	end

	def update
		@project = Project.find params[:id]
		if @project.update_attributes(project_params) then
			redirect_to project_path
		else 
			# TODO set some flash error message
			render 'edit'
		end
	end

	def destroy
		(Project.find params[:id]).destroy
		redirect_to '/'
	end

	def project_params
		params.require(:project).permit(:name, :description, :user_id)
	end
end
