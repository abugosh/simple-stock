require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { should have_db_column(:name) }
  it { should have_db_column(:ticker_symbol) }
  it { should have_db_column(:exchange) }

  context "self#load_from_csv" do
    let(:sample_data) {
      <<-data
"Symbol","Name","LastSale","MarketCap","IPOyear","Sector","industry","Summary Quote",
"PIH","1347 Property Insurance Holdings, Inc.","6.4","$39.09M","2014","Finance","Property-Casualty Insurers","http://www.nasdaq.com/symbol/pih",
"FLWS","1-800 FLOWERS.COM, Inc.","9.21","$602.63M","1999","Consumer Services","Other Specialty Stores","http://www.nasdaq.com/symbol/flws",
"FCCY","1st Constitution Bancorp (NJ)","12.6","$100.07M","n/a","Finance","Savings Institutions","http://www.nasdaq.com/symbol/fccy",
      data
    }

    let(:data_normal) {
      <<-data_normal
"Symbol","Name"
"FOO","Foo Inc"
"BAR","Bar Inc"
      data_normal
    }

    let(:data_unordered) {
      <<-data_normal
"Name","Symbol",
"Foo Inc","FOO"
"Bar Inc","BAR"
      data_normal
    }

    it "creates one record per row, ignoring header" do
      expect{ Stock.load_from_csv("FOO", sample_data) }.to change{Stock.count}.by(3)
    end

    it "finds columns on name" do
      expect{ Stock.load_from_csv("ABC", data_normal) }.to change{Stock.count}.by(2)

      expect(Stock.where(name: 'Foo Inc').count).to eq(1)
      expect(Stock.where(name: 'Bar Inc').count).to eq(1)

      expect(Stock.where(ticker_symbol: 'FOO').count).to eq(1)
      expect(Stock.where(ticker_symbol: 'BAR').count).to eq(1)
    end

    it "finds columns on name in any order" do
      expect{ Stock.load_from_csv("ABC", data_unordered) }.to change{Stock.count}.by(2)

      expect(Stock.where(name: 'Foo Inc').count).to eq(1)
      expect(Stock.where(name: 'Bar Inc').count).to eq(1)

      expect(Stock.where(ticker_symbol: 'FOO').count).to eq(1)
      expect(Stock.where(ticker_symbol: 'BAR').count).to eq(1)
    end

    it "puts the exchange in every record" do
      expect{ Stock.load_from_csv("FOO", sample_data) }.to change{Stock.where(exchange: 'FOO').count}.by(3)
    end
  end

  context "self#search" do
    let!(:stock) { create(:stock) }

    it "finds records that start with a string" do
      expect(Stock.search(stock.name[0..2])).to include(stock)
    end

    it "ignores case" do
      expect(Stock.search(stock.name[0..2].downcase)).to include(stock)
      expect(Stock.search(stock.name[0..2].upcase)).to include(stock)
    end

    it "finds records for same string" do
      expect(Stock.search(stock.name)).to include(stock)
    end

    it "looks for stocks with an empty name if given a blank" do
      expect(Stock.search(nil)).to_not include(stock)
      expect(Stock.search('')).to_not include(stock)
    end
  end
end
