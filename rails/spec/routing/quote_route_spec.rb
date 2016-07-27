require 'rails_helper'

RSpec.describe "routing to quotes", :type => :routing do
  it "routes /api/quotes/:symbol to quotes#history" do
    expect(:get => "/api/quotes/QWERTY1").to route_to(
      :controller => "quotes",
      :action => "history",
      :symbol => "QWERTY1"
    )
  end
end
