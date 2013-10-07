class UsersController < ApplicationController





	def project_params
		params.require(:user).permit(:name, :email)
	end
end