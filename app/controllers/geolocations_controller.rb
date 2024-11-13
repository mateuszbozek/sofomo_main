class GeolocationsController < ActionController::API
  require 'net/http'

  def index
    geolocations = Geolocation.all
    render json: geolocations.to_json
  end

  def create
    myip = params[:ip]
    access_api_key = '662b1b3c5e4dce05f038a9f8019b295c'

    uri = URI("http://api.ipstack.com/#{myip}?access_key=#{access_api_key}")
    res = Net::HTTP.get(uri)
    response = SaveGeolocationService.new(JSON.parse(res)).call
    render json: response
  end

  def destroy
    geolocation = Geolocation.find(params[:id])
    if geolocation.destroy
      render json: { 'message': 'Geolocation has been deleted.'}
    else
      render json: { 'message': geolocation.error }
    end
  end
end