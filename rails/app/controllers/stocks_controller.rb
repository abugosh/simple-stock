class StocksController < ApplicationController
  def show
    stock = Stock.where(ticker_symbol: params[:symbol]).first

    if stock
      render json: view_data(stock)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def search
    stocks = Stock.search(params[:name]).map {|stock| view_data(stock)}

    render json: stocks
  end

  private

  def view_data(stock)
    {name:     stock.name,
     symbol:   stock.ticker_symbol,
     exchange: stock.exchange}
  end
end
