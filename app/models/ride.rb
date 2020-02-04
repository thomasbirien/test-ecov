class Ride < ApplicationRecord
  include AASM
  before_save :generate_reference
  after_create :state_created

  # Aasm =======================================================================

  aasm column: 'state' do

    state :created
    state :started
    state :canceled

    event :ride_start do
      transitions to: :started, success: :notify_started
    end

    event :ride_cancel do
      transitions to: :canceled, success: :notify_canceled
    end
  end

  def notify_started
    puts "started"
  end

  def notify_canceled
    puts "canceled"
  end

  private

    def state_created
      puts "created, need to connect bill"
    end

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
