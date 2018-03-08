require 'weather_api'

class HomeController < ApplicationController

  def index
    if params[:days] && ![1, 2, 3, 4, 5].include?(params[:days].to_i)
      redirect_to '/'
      return
    end
    num_of_days = params[:days].to_i
    @data = WeatherApi.http_get({num_of_days: params[:days]})

    respond_to do |format|
        format.js
        format.html
    end
  end

end
