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
    airport = Airport.new
    expect(airport.has_plane?(plane)).to eq false
  end 
end