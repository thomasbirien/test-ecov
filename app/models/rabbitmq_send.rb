class RabbitmqSend
  require "bunny"

  def self.send(message, queue)

    # Start a communication session with RabbitMQ
    connection = Bunny.new
    connection.start

    # open a channel
    channel = connection.create_channel

    # declare a queue
    queue  = channel.queue(queue)

    channel.default_exchange.publish(message, routing_key: queue.name)

    connection.stop

  end
end
