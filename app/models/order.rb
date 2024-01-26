class Order < ApplicationRecord
  belongs_to :user
  has_many :product, through: :order_products
end
