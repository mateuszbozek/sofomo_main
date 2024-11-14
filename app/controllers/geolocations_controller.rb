class GeolocationsController < ActionController::API
  require 'net/http'

  def index
    geolocations = Geolocation.all.to_json
    render json: geolocations
  end

  def create
    myip = params[:data][:ip]
    uri = URI("http://api.ipstack.com/#{myip}?access_key=#{ENV['ipstack_key']}")
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