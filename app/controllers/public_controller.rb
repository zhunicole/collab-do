class PublicController < ApplicationController
	def index
		@projects = Project.active

	end


end