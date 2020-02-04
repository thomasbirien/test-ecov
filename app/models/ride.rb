class Ride < ApplicationRecord
  before_save :generate_reference

  private
    def generate_reference
      random_ref = SecureRandom.base58(4)

      if Ride.exists?(ref: random_ref)
        loop do
          random_ref = SecureRandom.base58(4)
          break if !Ride.exists?(ref: random_ref)
        end
      end
      self.ref = random_ref
    end
end
