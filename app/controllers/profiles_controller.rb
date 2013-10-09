class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  def edit

  end

  def update
  	if current_user.update_attributes(user_params) then 
      redirect_to ''
    else 
      render 'edit'
    end
  end


  def user_params
		params.require(:user).permit(:first_name, :last_name, 
			:email, :location, :avatar, :blurb, :portfolio)
	end

end