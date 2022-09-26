require 'rails_helper'

RSpec.describe Geocode do
  it 'exists and has attributes' do
    coord = {
              "lat": 45.516018,
              "lng": -122.681425
            }
    destination = Geocode.new(coord)

    expect(destination).to be_a Geocode
    expect(destination.latitude).to eq(45.516018)
    expect(destination.longitude).to eq(-122.681425)
  end
end