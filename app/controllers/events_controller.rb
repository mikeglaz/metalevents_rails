class EventsController < ApplicationController
  # expose :event

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    date_and_time = event_params[:date_and_time]

    # byebug

    @event = current_user.events.build(event_params.merge({date_and_time: parsed_date_time(date_and_time)}))

    if @event.save
      flash[:success] = 'Event was successfully created.'
      redirect_to @event
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params.merge({date_and_time: parsed_date_time}))
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event successfully deleted!"
    redirect_to root_path
  end

  private

    def event_params
      params.require(:event).permit(:venue_id, :name, :description, :date_and_time)
    end

    def parsed_date_time(date_and_time)
      DateTime.strptime(date_and_time, '%m/%d/%Y %l:%M %p')
    end
end
