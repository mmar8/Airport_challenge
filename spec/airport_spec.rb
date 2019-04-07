require './lib/airport'
require './lib/plane'

describe Airport do

  before (:each) do
    @plane = Plane.new
  end

  it 'can land a plane' do
    expect(subject).to respond_to(:land)
  end

  it 'can confirm plane is in the airport' do
    expect(subject.land(@plane)).to eq [@plane]
  end

  it 'plane can take off' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'able to confirm plane no longer in the airtport' do 
    subject.land(@plane)
    plane = subject.takeoff(@plane)
    expect(subject.hangar).not_to include @plane
  end 

  it 'has a default capacity of 10' do 
    airport = Airport.new(10)
    expect(subject.capacity).to eq 10
  end

  it 'prevents plane from landing if airport is full' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.land(@plane)}
    expect { airport.land(@plane) }.to raise_error 'Airport Full!'
  end 

  it 'prevents plane from taking off if the weather is stormy' do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.takeoff(@plane) }.to raise_error 'Weather is stormy!No take off'
  end
end