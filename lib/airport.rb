 require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity 
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'Airport Full!' if airport_full?
    @hangar << plane
  end 

  def takeoff_plane
    @hangar.pop
    raise "Weather is stormy!No take off" if is_stormy?

  end

  def airport_full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def is_stormy?
  end

end
