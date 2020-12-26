class EventsController < ApplicationController
    def index
        @event = Event.all.order("id DESC")
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
end
