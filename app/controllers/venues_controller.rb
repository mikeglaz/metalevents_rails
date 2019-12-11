class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def create
     @venue = Venue.new(venue_params)

    if @venue.save
      flash[:success] = 'Venue was successfully created.'
      redirect_to @venue
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue
    else
      render 'show'
    end
  end

  def destroy
    @venue.destroy
    flash[:success] = "Venue successfully deleted!"
    redirect_to venues_path
  end

  private

    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :address, :city, :state, :url)
    end
end
