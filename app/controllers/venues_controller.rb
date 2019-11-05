class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])

    # byebug

    if @venue.update(venue_params)
      redirect_to @venue
    else
      render 'show'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(
      events_attributes: [:id, :name, :description, :date_and_time]
      )
  end
end
