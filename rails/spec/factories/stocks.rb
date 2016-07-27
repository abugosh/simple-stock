FactoryGirl.define do
  factory :stock do
    sequence :name do |n|
      "Company#{n}"
    end

    sequence :ticker_symbol do |n|
      "QWERTY#{n}"
    end

    exchange "ABC"
  end
end
