class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(user_params)
    if @user.save
      # debugger
      render :show
    else
      # debugger
      render json: ['You\'re late, username/email already taken :3'], status: 401
    end
  end

  private
  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end