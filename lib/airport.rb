 require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity 
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport Full!' if airport_full?
    @hangar << plane

  end 

  def takeoff(plane)
    @hangar.delete(plane)
    raise "Weather is stormy!No take off" if stormy? == true
  end

  def airport_full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def stormy?
    [true,false,true,false,false,false].sample
  end

end
