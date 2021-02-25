# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @user = helpers.current_user
  end
end
