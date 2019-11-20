class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
    # date_and_time = @event.date_and_time.to_s
    @event.date_and_time = @event.date_and_time.strftime('%m/%d/%Y %l:%M %p')
  end

  def create
    @event = current_user.events.build(event_params.merge({date_and_time: parsed_date_time}))

    if @event.save
      flash[:success] = 'Event was successfully created.'
      redirect_to @event
    else
      render :new
    end
  end

  def update
    if @event.update_attributes(event_params.merge({date_and_time: parsed_date_time}))
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event successfully deleted!"
    redirect_to root_path
  end

  private
    def date_and_time
      event_params[:date_and_time]
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:venue_id, :name, :description, :date_and_time)
    end

    def parsed_date_time
      DateTime.strptime(date_and_time, '%m/%d/%Y %l:%M %p')
    end

    def current_resource
      @current_resource ||= Event.find(params[:id]) if params[:id]
    end
end
