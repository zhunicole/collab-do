class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 


  # helper_method :created_projects
  # helper_method :collabed_projects

  # def created_projects

  # 	Project.where(creator_id: this.id)
  # end

  # def collabed_projects
  # 	this.projects - Project.where(creator_id: this.id)
  # end


end
