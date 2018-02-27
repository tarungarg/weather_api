require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  it 'queries weather site for fetching 1 day data' do
    uri = URI('http://api.worldweatheronline.com/premium/v1/weather.ashx')

    response = JSON.load(Net::HTTP.get(uri))
    expect(response["data"]["weather"].count).to eq 1
  end

end