class RidesController < ApplicationController
  before_action :find_ride, only: [:start, :cancel]
  def index
    @rides = Ride.all
  end

  def create
    ride = Ride.new
    ride.generate_ref
    ride.save

    redirect_to root_path
  end

  def start
    @ride.ride_start!
    redirect_to root_path
  end

  def cancel
    @ride.ride_cancel!
    redirect_to root_path
  end

  private

  def find_ride
    @ride = Ride.find(params[:id])
  end
end
