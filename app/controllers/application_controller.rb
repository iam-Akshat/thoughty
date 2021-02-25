class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to sign_in_path unless helpers.signed_in?
  end
end
