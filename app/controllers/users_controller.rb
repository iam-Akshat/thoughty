# User controller
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :full_name, :profile_pic, :cover_pic)
  end
end
