class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      flash[:success] = "Event added sucessfully"
      redirect_to root_url
    else
      flash[:error] = "There was a problem adding the event"
      redirect_to root_url
    end

  end

  def edit
  end

end

