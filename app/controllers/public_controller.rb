class PublicController < ApplicationController
	def index
		@projects = Project.active

	end

	def about
		@featured_users = User.featured
	end

end