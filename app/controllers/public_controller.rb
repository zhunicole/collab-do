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

		@sender = params[:sender_email]
		@receiver = 'nicolez@stanford.edu'
		@message = params[:message]
		# UserMailer.collab_request(@sender, @receiver, @message).deliver
 
	  format.html { redirect_to(root_path, notice: 'Email was successfully created.') }
	  # format.json { render json: @user, status: :created, location: @user }

	end

end