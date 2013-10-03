class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params.merge(user_id: session[:user_id]))		

		if @project.save then 
			redirect_to '/home'
		else
			render 'new'
		end


	end


	def project_params
		params.require(:project).permit(:name, :description, :user)

	end
end
