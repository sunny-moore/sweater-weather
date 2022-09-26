class GeocodeService

  def self.geocode(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")
    parse_json(response)[:results][0][:locations][0][:latLng]
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV.fetch('mq_api_key', nil)
    end
  end
end