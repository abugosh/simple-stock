Rails.application.routes.draw do
  get '/api/quotes/:symbol', to: 'quotes#history'

  get '/api/stocks/search',  to: 'stocks#search'
  get '/api/stocks/:symbol', to: 'stocks#show'
end
