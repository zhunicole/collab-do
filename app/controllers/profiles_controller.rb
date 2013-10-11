class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  def index
    
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
    if current_user != @user then
      redirect_to unacceptable_path
    end
  end

  def update
    @user = User.find params[:id]
  	if @user.update_attributes(user_params) then 
      redirect_to profile_path(@user)
    else 
      render 'edit'
    end
  end


  def user_params
		params.require(:user).permit(:first_name, :last_name, 
			:email, :location, :avatar, :blurb, :portfolio)
	end

end