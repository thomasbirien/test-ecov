class RidesController < ApplicationController

  def index
  end

  def create
    Ride.create
  end

  def start
    # need to find a specific ride
    ride.ride_start!
  end

  def cancel
    # need to find a specific ride
    ride.ride_cancel!
  end
end
