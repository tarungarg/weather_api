require 'sinatra/base'

class FakeWeather < Sinatra::Base

  get '/premium/v1/weather.ashx' do
    json_response(200, 'weather_data.json')
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(Rails.root.join('spec/' + 'fixtures/' + file_name)).read
  end

end
