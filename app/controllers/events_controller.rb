class EventsController < ApplicationController
    def index
        # @event = Event.all.order("id DESC")
        @search = Event.ransack(params[:q])
        @events = @search.result(distinct: true)
    end

    def show
        @event = Event.find_by(id: params[:id])
    end

    def new
    end

    def create
        @event = Event.new(title: params[:title], skill: params[:skill], description: params[:description])
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
        @event.description = params[:description]
        @event.url = params[:url]
        @event.image = params[:image]
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
end
