class PublicController < ApplicationController
	def index
		@projects = Project.all
	end
end