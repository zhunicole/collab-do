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

	end

end