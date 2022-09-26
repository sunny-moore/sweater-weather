require 'rails_helper'

RSpec.describe 'GeocodeService' do
  it 'returns latitude/longitude for a given city', :vcr do
    location = 'portland, or'
    VCR.use_cassette('geocode') do
      @results = GeocodeService.geocode(location)
    end

    expect(@results).to be_a Hash
    expect(@results).to have_key(:lat)
    expect(@results[:lat]).to eq(45.516018)
    expect(@results).to have_key(:lng)
    expect(@results[:lng]).to eq(-122.681425)
  end
end