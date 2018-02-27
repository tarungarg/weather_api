require 'weather_api'

class HomeController < ApplicationController

  def index
    num_of_days = params[:days]
    @data = WeatherApi.http_get({num_of_days: params[:days]})

    respond_to do |format|
        format.js
        format.html
    end
  end

end
