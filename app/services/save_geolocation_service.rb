class SaveGeolocationService
  def initialize(geolocation_json)
    @geolocation_json = geolocation_json
  end

  def call
    ActiveRecord::Base.transaction do
      new_geolocation = set_geolocation
      new_geolocation.save
      new_location = set_location(new_geolocation)
      new_location.save
      new_languages = set_languages(new_location)
      new_languages&.each do |language|
        language.save
      end
      { 'message': 'Geolocation has been saved.'}
    end

  end

  private

  def set_geolocation
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
    
  end

  def set_location(geolocation)
    temp_location = @geolocation_json["location"]
    
    location = Location.new( geoname_id: temp_location["geoname_id"],
                             capital: temp_location["capital"],
                             country_flag: temp_location["country_flag"],
                             country_flag_emoji: temp_location["country_flag_emoji"],
                             country_flag_emoji_unicode: temp_location["country_flag_emoji_unicode"],
                             calling_code: temp_location["calling_code"],
                             is_eu: temp_location["is_eu"],
                             geolocation_id: geolocation.id )
  end

  def set_languages(location)
    temp_languages = @geolocation_json["location"]["languages"]
    languages = []
    temp_languages&.each do |language|
        languages << Language.new( code: language["code"],
                                 name: language["name"],
                                 native: language["native"],
                                 location_id: location.id )
        
    end

    languages
  end

end
