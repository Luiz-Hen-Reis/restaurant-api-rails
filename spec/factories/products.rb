FactoryBot.define do
  factory :product do
      name { "Product 1" }
      price { 29.99 }
      description { 'This is a description' }
      association :category
  end
end
