require 'uri'
require 'open-uri'

module WeatherApi

  def self.http_get( params = {})
    domain = "http://api.worldweatheronline.com/premium/v1/weather.ashx"

    params[:format] ||= 'json'
    params[:key] ||= '66f18a0d0f064db5a2e62225182702'
    params[:q] ||= 'London'
    params[:num_of_days] ||= '1'


    uri = URI.parse(domain)
    uri.query = URI.encode_www_form( params )

    response = JSON.parse(uri.open.read)

    return response["data"]["weather"]
  end

end
