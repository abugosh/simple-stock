class QuotesController < ApplicationController
  def history
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.historical_quotes(params[:symbol], start_date: Time.now - 30.days, end_date: Time.now)

    data = data.map do |quote|
      {open: quote.open,
       close: quote.close,
       high: quote.high,
       low: quote.low,
       date: quote.trade_date}
    end

    render json: data
  end
end
