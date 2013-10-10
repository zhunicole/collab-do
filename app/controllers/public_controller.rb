class PublicController < ApplicationController
	def index
		@projects = Project.where(ongoing: true)

	end


end