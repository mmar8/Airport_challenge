 require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity 
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'Airport Full!' if airport_full?
    @hangar.push(plane)
  end 

  def takeoff_plane
    @hangar.pop
  end

  def airport_full?
    @hangar.count >= capacity
  end

end
