require 'rails_helper'

RSpec.describe QuotesController, type: :controller do

  context "history" do
    let(:yahoo_client) { instance_double("YahooFinance::Client") }
    let(:yahoo_data) { YAML.load("---\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-26'\n    :open: '739.039978'\n    :high: '741.690002'\n    :low: '734.27002'\n    :close: '738.419983'\n    :volume: '1179400'\n    :adjusted_close: '738.419983'\n    :symbol: GOOG\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-25'\n    :open: '740.669983'\n    :high: '742.609985'\n    :low: '737.50'\n    :close: '739.77002'\n    :volume: '1030700'\n    :adjusted_close: '739.77002'\n    :symbol: GOOG\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-22'\n    :open: '741.859985'\n    :high: '743.23999'\n    :low: '736.559998'\n    :close: '742.73999'\n    :volume: '1256300'\n    :adjusted_close: '742.73999'\n    :symbol: GOOG\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-21'\n    :open: '740.359985'\n    :high: '741.690002'\n    :low: '735.830994'\n    :close: '738.630005'\n    :volume: '969100'\n    :adjusted_close: '738.630005'\n    :symbol: GOOG\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-20'\n    :open: '737.330017'\n    :high: '742.130005'\n    :low: '737.099976'\n    :close: '741.190002'\n    :volume: '1289700'\n    :adjusted_close: '741.190002'\n    :symbol: GOOG\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-19'\n    :open: '729.890015'\n    :high: '736.98999'\n    :low: '729.00'\n    :close: '736.960022'\n    :volume: '1227500'\n    :adjusted_close: '736.960022'\n    :symbol: GOOG\n- !ruby/object:OpenStruct\n  table:\n    :trade_date: '2016-07-18'\n    :open: '722.710022'\n    :high: '736.130005'\n    :low: '721.190002'\n    :close: '733.780029'\n    :volume: '1295500'\n    :adjusted_close: '733.780029'\n    :symbol: GOOG\n") }
    let(:parsed_data) { [{"open":"739.039978","close":"738.419983","high":"741.690002","low":"734.27002","date":"2016-07-26"},{"open":"740.669983","close":"739.77002","high":"742.609985","low":"737.50","date":"2016-07-25"},{"open":"741.859985","close":"742.73999","high":"743.23999","low":"736.559998","date":"2016-07-22"},{"open":"740.359985","close":"738.630005","high":"741.690002","low":"735.830994","date":"2016-07-21"},{"open":"737.330017","close":"741.190002","high":"742.130005","low":"737.099976","date":"2016-07-20"},{"open":"729.890015","close":"736.960022","high":"736.98999","low":"729.00","date":"2016-07-19"},{"open":"722.710022","close":"733.780029","high":"736.130005","low":"721.190002","date":"2016-07-18"}] }

    before :each do
      expect(YahooFinance::Client).to receive(:new).and_return(yahoo_client)
    end

    it "succeeds" do
      expect(yahoo_client).to receive(:historical_quotes).and_return([])
      get :history, symbol: "QWERTY1"

      expect(response).to have_http_status(:ok)
    end

    it "returns empty json array for unknown symbol" do
      expect(yahoo_client).to receive(:historical_quotes).and_return([])
      get :history, symbol: "unknown_company"

      expect(response.body).to eq([].to_json)
    end

    it "succeeds with no arguments" do
      expect(yahoo_client).to receive(:historical_quotes).and_return(yahoo_data)

      get :history, symbol: "QWERTY1"

      expect(response.body).to eq(parsed_data.to_json)
    end
  end
end
