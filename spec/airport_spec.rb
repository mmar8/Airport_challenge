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

end