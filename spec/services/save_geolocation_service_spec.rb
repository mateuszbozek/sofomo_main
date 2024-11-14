require 'rails_helper'

RSpec.describe SaveGeolocationService, type: :service do

    describe '#call' do
      let(:response) { {
        "ip"=>"145.150.20.188", 
        "type"=>"ipv4", 
        "continent_code"=>"EU", 
        "continent_name"=>"Europe", 
        "country_code"=>"NL", 
        "country_name"=>"Netherlands", 
        "region_code"=>"UT", 
        "region_name"=>"Utrecht", 
        "city"=>"Utrecht", 
        "zip"=>"3509", 
        "latitude"=>52.09429931640625, 
        "longitude"=>5.112500190734863, 
        "msa"=>nil, 
        "dma"=>nil, 
        "radius"=>nil, 
        "ip_routing_type"=>"fixed", 
        "connection_type"=>"tx", 
        "location"=>{
            "geoname_id"=>2745912, 
            "capital"=>"Amsterdam", 
            "languages"=>
             [
               {"code"=>"nl", 
               "name"=>"Dutch", 
               "native"=>"Nederlands"} ], 
             "country_flag"=>"https://assets.ipstack.com/flags/nl.svg", 
             "country_flag_emoji"=>"🇳🇱", 
             "country_flag_emoji_unicode"=>"U+1F1F3 U  +1F1F1", 
             "calling_code"=>"31", 
             "is_eu"=>true}
      } }

      it 'request save geolocation' do
        service = described_class.new(response)
        resp_service = service.call
        expect(resp_service).to be_an_instance_of(Hash)
        expect(resp_service[:message]).to eq("Geolocation has been saved.")
      end
    end
end