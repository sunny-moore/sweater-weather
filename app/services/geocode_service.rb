class GeocodeService

  def self.geocode(location)
    response = conn.get("?key=#{ENV['mq_api_key']}&location=#{location}")
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/address') do |faraday|
      faraday.params['api_key'] = ENV.fetch('mq_api_key', nil)
    end
  end
end