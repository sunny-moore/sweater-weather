require 'rails_helper'

RSpec.describe GeocodeService do
  it 'returns latitude/longitude for a given city', vcr: 'geocode' do
    location = 'portland, or'

    results = GeocodeService.geocode(location)

    expect(results).to be_a Hash
    expect(results[0]).to be_a Array
    expect(results[0][:providedLocation][:location]).to eq(location)
    expect(results[0][:locations][:latLng]).to have_key(:lat)
    expect(results[0][:locations][:latLng][:lat]).to eq(45.516018)
    expect(results[0][:locations][:latLng]).to have_key(:lng)
    expect(results[0][:locations][:latLng][:lng]).to eq(-122.681425)
  end
end