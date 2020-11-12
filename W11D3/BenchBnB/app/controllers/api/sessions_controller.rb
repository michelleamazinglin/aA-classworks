class Api::SessionsController < ApplicationController
    before_action :require_signed_in!, only: [:destory]
    skip_before_action :verify_authenticity_token

  def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ['Try again with right username/password :D!'], status: 422
    else
      sign_in!(@user)
      render json: ['Welcome home <3'], status: 200
    end
  end

  def destroy
    if current_user
        sign_out!
        render json: ['Hahahaha you are signed out ;D.']
    else
        render json: ['You can\'t sign out if you don\'t sign in :D '], status: 422
    end
  end

end