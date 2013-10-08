class ProfilesController < ApplicationController
     
  def edit
    @user = User.find(current_user.id)

  end

  def update
    @user = User.find(current_user.id)
    
  	if @user.update_attributes(user_params) then 
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