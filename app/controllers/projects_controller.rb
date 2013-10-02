class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def create

		current_user = session[:current_user]
		@project = Project.new(project_params)
		@project.user = current_user

		if @project then @project.save end


	end


	def project_params
		params.require(:project).permit(:name, :description, :user)

	end
end
