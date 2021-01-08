class UsersController < ApplicationController
	def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :profile_id)
  end
  private :resource_params
end

