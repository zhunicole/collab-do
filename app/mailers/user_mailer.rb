class UserMailer < ActionMailer::Base
  default from: "nicolez@stanford.edu"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Collab.do!')
		# TODO once users models is back
  end


  def collab_request(sender, receiver, message)

  	@sender = sender
  	@receiver = receiver
  	@message = message

  	mail(to: @receiver, subject: 'Someone is interested in joining your project!')

end
