class LikesController < ApplicationController

    before_action :require_login, only: [:create, :destroy]

    def create
        @like = Like.new(user_id: current_user.id, work_id: params[:work_id])
        if @like.save
            redirect_to("/works/table")
        end
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id, work_id: params[:work_id])
        if @like.destroy
            redirect_to("/works/table")
        end
    end
end
