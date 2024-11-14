class SaveGeolocationService
  def initialize(geolocation_json)
    @geolocation_json = geolocation_json
  end

  def call
    ActiveRecord::Base.transaction do
      geolocation = find_or_create_geolocation
      location = find_or_create_location(geolocation)
      find_or_create_languages(location)
    end
    { 'message': 'Geolocation has been saved.'}
  rescue StandardError => e
     { error: e.class, message: e.message }
  end

  private

  def find_or_create_geolocation
    geolocation = Geolocation.find_or_create_by(ip: @geolocation_json["ip"],
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
    
  end

  def find_or_create_location(geolocation)
    temp_location = @geolocation_json["location"]
    
    location = Location.find_or_create_by( geoname_id: temp_location["geoname_id"],
                                           capital: temp_location["capital"],
                                           country_flag: temp_location["country_flag"],
                                           country_flag_emoji: temp_location["country_flag_emoji"],
                                           country_flag_emoji_unicode: temp_location["country_flag_emoji_unicode"],
                                           calling_code: temp_location["calling_code"],
                                           is_eu: temp_location["is_eu"],
                                           geolocation_id: geolocation.id )
  end

  def find_or_create_languages(location)
    temp_languages = @geolocation_json["location"]["languages"]
    languages = []
    temp_languages&.each do |language|
        Language.find_or_create_by( code: language["code"],
                                 name: language["name"],
                                 native: language["native"],
                                 location_id: location.id )
        
    end
  end

end
