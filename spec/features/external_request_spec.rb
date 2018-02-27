require "rails_helper"
require "rspec/expectations"

RSpec.feature "Widget management", :type => :feature do

  describe "API hit to weather" do

    before(:each) do
      uri = URI('http://api.worldweatheronline.com/premium/v1/weather.ashx')
      @response = JSON.load(Net::HTTP.get(uri))
    end

    it 'will fetch 1 day data' do
      expect(@response["data"]["weather"].count).to eq 1
    end

    it 'has some data in request' do
      expect(@response["data"]["weather"]).not_to be_empty
    end

    it 'queries weather data have right key' do
      expect(@response["data"]).to have_key('weather')
    end
  end

end