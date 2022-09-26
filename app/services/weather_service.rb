class WeatherService
  def self.get_weather(lat, lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely,alerts&units=imperial")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true) if response.status == 200
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['weather_key']
    end
  end
end
