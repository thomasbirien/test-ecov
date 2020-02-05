class RidesController < ApplicationController
  before_action :find_ride, only: [:start, :cancel]
  def index
    @rides = Ride.all
  end

  def create
    Ride.create
    redirect_to root_path
  end

  def start
    # need to find a specific ride
    @ride.ride_start!
    redirect_to root_path
  end

  def cancel
    # need to find a specific ride
    @ride.ride_cancel!
    redirect_to root_path
  end

  private

  def find_ride
    @ride = Ride.find(params[:id])
  end
end
