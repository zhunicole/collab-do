class PublicController < ApplicationController
	def index
		@projects = Project.active

	end

	def about

	end

end