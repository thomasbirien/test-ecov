class Ride < ApplicationRecord
  after_create

  private
    def generate_reference
    end
end
