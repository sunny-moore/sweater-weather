class GeocodeFacade

  def self.geocode(location)
    data = GeocodeService.geocode(location)
    result = Geocode.new(data)
  end
end