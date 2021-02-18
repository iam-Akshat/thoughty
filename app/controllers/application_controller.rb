class ApplicationController < ActionController::Base
    before_action :authenticate_user!

   
    def authenticate_user!
        unless helpers.signed_in?
            redirect_to sign_in_path
        end
    end 
end
