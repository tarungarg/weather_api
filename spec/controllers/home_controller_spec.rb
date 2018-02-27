require 'rails_helper'

RSpec.describe 'HomeController', type: :controller do
  context "GET #index" do
    it "should populate weather data" do
      VCR.use_cassette("weather_api") do
        get :index
        assigns(:data).should eq([contact])
      end
    end

  end
end
