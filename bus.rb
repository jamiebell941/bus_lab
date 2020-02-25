require('pry-byebug')

class Bus

  attr_accessor :route_number, :destination

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum Brum"
  end

  def passenger_count
    @passengers.count
  end

  def pick_up(passenger)
    @passengers.push(passenger)
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty_bus
    @passengers = []
  end

  def pick_up_from_stop(stop)
    stop.queue.each() do |passenger|
      # binding.pry
      @passengers.push(passenger)
    end

    stop.empty_bus_stop()

  end
end

class BusStop

  attr_accessor :queue

  def initialize(queue=[])
    @queue = queue
  end

  def queue_count
    @queue.count
  end

  def add_to_queue(person)
    @queue.push(person)
  end

  def empty_bus_stop
    @queue = []
  end

end
