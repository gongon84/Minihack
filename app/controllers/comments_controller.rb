class CommentsController < ApplicationController

  def create
    if current_user
      @comments = Comment.new(user_id: current_user.id, event_id: params[:event_id], name: params[:name], comment: params[:comment])
    else
      @comments = Comment.new(event_id: params[:event_id], name: params[:name]+"(ゲスト)", comment: params[:comment])
    end
    if @comments.save
      @event = Event.find_by(id: params[:event_id])
      @comments = Comment.all
    else
      render("events/show")
    end
  end

  def destroy
    @comments = Comment.find_by(id: params[:comment_id])
    if @comments.destroy
      @event = Event.find_by(id: params[:event_id])
      @comments = Comment.all
    else
      render("events/show")
    end
  end
end
