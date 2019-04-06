require './lib/airport'
require './lib/plane'

describe Airport do
  it 'can land a plane' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'can confirm plane is in the airport' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it 'plane can take off' do
    expect(subject).to respond_to(:takeoff_plane)
  end

  it 'able to confirm plane no longer in the airtport' do 
    plane = Plane.new
    subject.land_plane(plane)
    plane = subject.takeoff_plane
    expect(subject.hangar).not_to include plane
  end 

  it 'has a default capacity of 10' do 
    airport = Airport.new(10)
    expect(subject.capacity).to eq 10
  end

  it 'prevents plane from landing if airport is full' do
    airport = Airport.new
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { airport.land_plane(plane)}
    expect { airport.land_plane(plane) }.to raise_error 'Airport Full!'
  end 

  it 'prevents plane from taking off if the weather is stormy' do
    plane = Plane.new
    allow(subject).to receive(:is_stormy?).and_return true
    expect { subject.takeoff_plane }.to raise_error 'Weather is stormy!No take off'
  end
end