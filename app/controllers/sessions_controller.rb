class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  skip_before_action :verify_authenticity_token, only: [:create]
  # GET /sessions/new
  def new; end

  # POST /sessions
  def create
    user = User.find_by(username: params[:Username])
    if user.nil?
      flash[:error] = 'User not found'
      render 'new'
    else
      session[:user_id] = user.id
      redirect_to '/'
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end
