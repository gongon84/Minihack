class WorksController < ApplicationController
  def new
    @event = Event.find_by(id: params[:event_id])
  end

  def table
    @works = Work.all.order("id DESC")
    @likes = Like.all
  end

  def edit
    @work = Work.find_by(event_id: params[:event_id])
  end

  def update
    @work = Work.find_by(event_id: params[:event_id])
    if @work.update(work_params)
      redirect_to("/events/#{@work.event_id}/show")
    else
      render('/works/edit')
    end
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to("/events/#{@work.event_id}/show", notice: "登録しました")
    else
      render("events/show", notice: "登録できませんでした")
    end
  end

  def destroy_image
    @work = Work.find_by(event_id: params[:event_id])
    @work.remove_image_name!
    @work.save
  end

  private

  def work_params
    params.permit(:event_id, :title, :portfolio_url, :profile, :image_name)
  end
end
