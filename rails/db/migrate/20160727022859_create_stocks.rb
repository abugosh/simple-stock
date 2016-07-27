class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker_symbol
      t.string :exchange
    end
  end
end
