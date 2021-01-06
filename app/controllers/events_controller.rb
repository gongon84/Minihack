class EventsController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @search = Event.ransack(params[:q])
        @search.sorts = 'created_at desc' if @search.sorts.empty?
        @events = @search.result(distinct: true)
    end

    def show
        @event = Event.find_by(id: params[:id])
        @work = Work.find_by(event_id: params[:id])
        @comments = Comment.all
    end

    def new
    end

    def create
        @event = Event.new(user_id: current_user.id, title: params[:title], skill: params[:skill], accept_num: params[:accept_num], description: params[:description], status: "募集中")
        if @event.save
            redirect_to("/events/index")
        else
            render("events/new")
        end
    end

    def edit
        @event = Event.find_by(id: params[:id])
    end

    def update
        @event = Event.find_by(id: params[:id])
        @event.title = params[:title]
        @event.skill = params[:skill]
        @event.accept_num = params[:accept_num]
        @event.description = params[:description]
        @event.url = params[:url]
        @event.status = params[:status]
        if @event.save
            redirect_to("/events/#{@event.id}/show")
        else
            render("events/edit")
        end
    end

    def destroy
        @event = Event.find_by(id: params[:id])
        if @event.destroy
            redirect_to("/events/index")
        else
            render("events/show")
        end
    end

    def table
        @events = Event.all.order("id DESC")
    end
end
