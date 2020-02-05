class Ride < ApplicationRecord
  include AASM
  include Payment

  after_create :state_created

  validates :ref, uniqueness: true, presence: true

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
    self.pay
    RabbitmqSend.send("Start a ride: id: #{self.id}, ref: #{self.ref}","start")
  end

  def notify_canceled
    puts "canceled"
    self.reimburse
    RabbitmqSend.send("Cancel a ride: id: #{self.id}, ref: #{self.ref}","cancel")
  end

  def generate_ref
    random_ref = SecureRandom.base58(4)

    if Ride.exists?(ref: random_ref)
      loop do
        random_ref = SecureRandom.base58(4)
        break if !Ride.exists?(ref: random_ref)
      end
    end
    self.ref = random_ref
  end

  private

    def state_created
      puts "created, need to connect bill"
      self.bill
      RabbitmqSend.send("Create a new ride: id: #{self.id}, ref: #{self.ref}","create")
    end
end
