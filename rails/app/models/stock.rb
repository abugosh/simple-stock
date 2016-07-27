class Stock < ApplicationRecord

  def self.load_from_csv(exchange, data)
    CSV.parse(data, headers: true) do |row|
      self.create(name: row['Name'], ticker_symbol: row['Symbol'], exchange: exchange)
    end
  end

  def self.search(term)
    if term.blank?
      where(name: '')
    else
      where('name LIKE (?)', "#{term}%")
    end
  end
end
