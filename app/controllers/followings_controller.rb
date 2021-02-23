class FollowingsController < ApplicationController

    def create
        Following.create!(follower: helpers.current_user, followed_id: params['user'])
        redirect_to user_path(params['user'])
    end

    def destroy
        Following.destroy_by(follower: helpers.current_user, followed_id: params[:user])
        redirect_to user_path(params['user'])
    end
end
