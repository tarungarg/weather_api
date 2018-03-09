require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'functional tests for controller' do
    let(:client) { WeatherApi.http_get }

    context "GET #index" do
      it "should check the rendered template" do
        VCR.use_cassette("weather_api") do
          get :index, { days: 4 }
          expect(response).to render_template("index")
        end
      end

      it "should check data wrt to date" do
        expect(client.first["date"]).to eq("2018-02-27")
      end

      it "should check datatype of response" do
        expect(client).to be_an_instance_of(Array)
      end
    end

    context "Validating only 5 days allowed" do
      subject { get :index, { days: 6 } }

      it "should redirect to given url" do
        subject.should redirect_to '/'
      end

      it "should not render index as data input is wrong" do
        expect(subject).to_not render_template("index")
      end
    end
  end

end
