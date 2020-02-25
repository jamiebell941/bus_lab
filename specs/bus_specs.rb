require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus")
require_relative("../person")

class BusTest < MiniTest::Test
  def setup
    @bus1 = Bus.new(22, "Ocean Terminal")

    @passenger1 = Person.new("Jeff", 21)
    @passenger2 = Person.new("Bob", 47)
    @passengers = [@passenger1, @passenger2]
    @bus_stop1 = BusStop.new()
  end

  def test_passenger_count
    assert_equal(0, @bus1.passenger_count)
  end

  def test_pick_up
    @bus1.pick_up(@passenger1)
    assert_equal(1, @bus1.passenger_count)
  end

  def test_drop_off
    @bus1.pick_up(@passenger1)
    @bus1.pick_up(@passenger2)
    @bus1.drop_off(@passenger2)
    assert_equal(1, @bus1.passenger_count)
  end
  def test_empty_bus
    @bus1.pick_up(@passenger1)
    @bus1.pick_up(@passenger2)
    @bus1.empty_bus
    assert_equal(0, @bus1.passenger_count)
  end

  def test_add_to_queue
    @bus_stop1.add_to_queue(@passenger1)
    assert_equal(1, @bus_stop1.queue_count)
  end

  def test_pick_up_from_stop
    @bus_stop1.add_to_queue(@passenger1)
    @bus_stop1.add_to_queue(@passenger2)
    @bus1.pick_up_from_stop(@bus_stop1)
    assert_equal(0, @bus_stop1.queue_count)
    assert_equal(2, @bus1.passenger_count)
  end
end
