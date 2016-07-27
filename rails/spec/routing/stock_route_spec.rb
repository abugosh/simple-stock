require 'rails_helper'

RSpec.describe "routing to quotes", :type => :routing do
  it "routes /api/stock/:symbol to stock#show" do
    expect(:get => "/api/stocks/QWERTY1").to route_to(
      :controller => "stocks",
      :action => "show",
      :symbol => "QWERTY1"
    )
  end

  it "routes /api/stock/search to stock#search" do
    expect(:get => "/api/stocks/search").to route_to(
      :controller => "stocks",
      :action => "search"
    )
  end
end
