require 'rails_helper'

RSpec.describe 'Weather Service' do
  it 'can retrieve weather from Openweather' do
    VCR.use_cassette('weather-service', :record => :new_episodes)  do
      @weather = WeatherService.get_weather(45.516018, -122.681425)
    end

    expect(@weather).to be_a Hash
    expect(@weather).to have_key(:current)
    expect(@weather).to have_key(:hourly)
    expect(@weather).to have_key(:daily)
  end
end