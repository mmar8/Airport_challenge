require './lib/airport'

describe Airport do
  it 'can land a plane' do
    # plane = Plane.new
    expect(subject).to respond_to(:land_plane)
  end
end
