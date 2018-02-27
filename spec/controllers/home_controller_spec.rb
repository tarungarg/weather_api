require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe HomeController do
    let(:client) { WeatherApi.http_get }

    context "GET #index" do
      it "should populate weather data" do
        VCR.use_cassette("weather_api") do
          get :index
          expect(response).to render_template("index")
        end
      end

      it "should check weather data" do
        expect(client.first["date"]).to eq("2018-02-27")
      end

      it "should check array data" do
        expect(client).to be_an_instance_of(Array)
      end
    end
  end

end
