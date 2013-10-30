class PublicController < ApplicationController
	def index
		@projects = Project.active

	end

	def about
		@featured_users = User.featured
	end

	def connect

	end

	def add_collaber
		flash[:notice] = 'Your message has been sent'
		redirect_to root_path

	end

end