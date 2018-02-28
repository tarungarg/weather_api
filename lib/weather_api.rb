require 'uri'
require 'open-uri'

module WeatherApi

  def self.http_get( params = {})
    domain = Rails.application.secrets['domain']

    params[:format] ||= 'json'
    params[:key] ||= Rails.application.secrets['key']
    params[:q] ||= Rails.application.secrets['default_location']
    params[:num_of_days] ||= '1'


    uri = URI.parse(domain)
    uri.query = URI.encode_www_form( params )

    response = JSON.parse(uri.open.read)["data"]["weather"] rescue ''

    return response
  end

end
