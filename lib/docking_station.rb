require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end
end
# Capacity implementation does not follow encapsulation principle?
