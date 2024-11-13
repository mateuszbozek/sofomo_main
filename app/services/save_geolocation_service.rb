class SaveGeolocationService
  def initialize(geolocation_json)
    @geolocation_json = geolocation_json
  end

  def call
    create_geolocation
    byebug
  end

  private

  def create_geolocation
    geolocation = Geolocation.new(ip: @geolocation_json["ip"],
                                  protocol_ip:  @geolocation_json["type"],
                                  continent_code: @geolocation_json["continent_code"],
                                  continent_name: @geolocation_json["continent_name"],
                                  country_code:  @geolocation_json["country_code"],
                                  country_name:  @geolocation_json["country_name"],
                                  region_code: @geolocation_json["region_code"],
                                  region_name: @geolocation_json["region_name"],
                                  city:  @geolocation_json["city"],
                                  zip: @geolocation_json["zip"],
                                  latitude:  @geolocation_json["latitude"],
                                  longitude: @geolocation_json["longitude"],
                                  msa: @geolocation_json["msa"],
                                  dma:  @geolocation_json["dma"],
                                  radius: @geolocation_json["radius"],
                                  ip_routing_type: @geolocation_json["ip_routing_type"],
                                  connection_type: @geolocation_json["connection_type"] )
    geolocation.save
  end

end
