class LikesController < ApplicationController

    before_action :require_login, only: [:create, :destroy]

    def create
        @like = Like.new(user_id: current_user.id, work_id: params[:work_id])
        if @like.save
            @likes = Like.all
            @work = Work.find(params[:work_id])
        end
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id, work_id: params[:work_id])
        if @like.destroy
            @likes = Like.all
            @work = Work.find(params[:work_id])
        end
    end
end
