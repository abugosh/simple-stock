# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stock_csvs = {"NASDAQ" => "http://www.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=nasdaq&render=download",
              "NYSE"   => "http://www.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=nyse&render=download",
              "AMEX"   => "http://www.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=amex&render=download"}

stock_csvs.each do |exchange, url|
  raw = Net::HTTP.get(URI(url))
  Stock.load_from_csv(exchange, raw)
end
