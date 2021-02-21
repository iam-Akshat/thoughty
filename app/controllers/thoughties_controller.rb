class ThoughtiesController < ApplicationController
    def create
        Thoughty.create!(thought_params)
        redirect_to root_path
    end

    private
    def thought_params
        params.require(:thoughty).permit(:content,:author_id)
    end
end
