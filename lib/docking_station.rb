require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_writer :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def dock bike
    fail 'Station Full' if full?
    bikes << bike
    nil
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    bikes.pop
  end

  private

  attr_reader :bikes, :capacity

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end
