require 'rails_helper'

RSpec.describe 'Geocode Facade' do
  it 'makes geocode service call and returns a geocode object' do
    VCR.use_cassette('geocode facade') do
      @destination = GeocodeFacade.geocode('portland, or') 
    end
    

    expect(@destination).to be_a Geocode
    expect(@destination.latitude).to eq(45.516018)
    expect(@destination.longitude).to eq(-122.681425)
  end
end