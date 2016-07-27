require 'rails_helper'

RSpec.describe StocksController, type: :controller do

  describe "show" do
    let(:stock) { create(:stock) }

    it "succeeds" do
      get :show, symbol: stock.ticker_symbol

      expect(response).to have_http_status(:ok)
    end

    it "fails for non existant symbols" do
      expect{
        get :show, symbol: "unknown_symbol"
      }.to raise_error(ActionController::RoutingError)
    end

    it "only gets the relevant fields" do
      get :show, symbol: stock.ticker_symbol

      data = {name: stock.name, symbol: stock.ticker_symbol, exchange: stock.exchange}

      expect(response.body).to eq(data.to_json)
    end
  end

  describe "search" do
    let!(:stocks) { create_list(:stock, 2) }

    it "succeeds" do
      get :search

      expect(response).to have_http_status(:ok)
    end

    it "returns an empty json array for no input" do
      get :search

      expect(response.body).to eq([].to_json)
    end

    it "returns an empty json array for an empty name search" do
      get :search, name: ''

      expect(response.body).to eq([].to_json)
    end

    it "returns stocks with names that start with the search term" do
      get :search, name: 'Company'

      data = stocks.map do |stock|
        {name: stock.name,
         symbol: stock.ticker_symbol,
         exchange: stock.exchange}
      end

      expect(response.body).to eq(data.to_json)
    end

    it "returns nothing for stocks with other names" do
      get :search, name: 'fooCompany'

      expect(response.body).to eq([].to_json)
    end
  end
end
