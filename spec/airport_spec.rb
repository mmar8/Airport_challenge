require './lib/airport'

describe Airport do
  it 'can land a plane' do
    # plane = Plane.new
    expect(subject).to respond_to(:land_plane)
  end

  it 'plane can take off' do
    expect(subject).to respond_to(:takeoff_plane)
  end
end
