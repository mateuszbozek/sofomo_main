class GeolocationsController < ActionController::API
  require 'net/http'

  def index
    geolocations = Geolocation.all
    output = { 'geoLocations / index' => 'Is alive!' }.to_json
    render json: output
  end

  def create
    myip = '88.156.139.47'
    access_api_key = '662b1b3c5e4dce05f038a9f8019b295c'

    url = "http://api.ipstack.com/#{myip}?access_key=#{access_api_key}"
    headers = { 'Content-Type': 'application/json' }

    # uri = URI(url)
    # res = Net::HTTP.get(uri)
    # json = JSON.parse(res)

    json = "{\"ip\": \"88.156.139.47\", \"type\": \"ipv4\", \"continent_code\": \"EU\", \"continent_name\": \"Europe\", \"country_code\": \"PL\", \"country_name\": \"Poland\", \"region_code\": \"MZ\", \"region_name\": \"Mazovia\", \"city\": \"Praga Po\\u0142udnie\", \"zip\": \"03-285\", \"latitude\": 52.29322814941406, \"longitude\": 21.04315948486328, \"msa\": null, \"dma\": null, \"radius\": \"66.33769\", \"ip_routing_type\": \"fixed\", \"connection_type\": \"cable\", \"location\": {\"geoname_id\": 6545348, \"capital\": \"Warsaw\", \"languages\": [{\"code\": \"pl\", \"name\": \"Polish\", \"native\": \"Polski\"}], \"country_flag\": \"https://assets.ipstack.com/flags/pl.svg\", \"country_flag_emoji\": \"\\ud83c\\uddf5\\ud83c\\uddf1\", \"country_flag_emoji_unicode\": \"U+1F1F5 U+1F1F1\", \"calling_code\": \"48\", \"is_eu\": true}}"    
    response = SaveGeolocationService.new(JSON.parse(json)).call
    
    render json: response
  end

  def destroy
    output = { 'geoLocations / destroy' => 'Is alive!' }.to_json
    render json: output
  end
end