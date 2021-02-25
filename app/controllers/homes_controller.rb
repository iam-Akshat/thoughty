class HomesController < ApplicationController
  def index
    @user = helpers.current_user
  end
end
