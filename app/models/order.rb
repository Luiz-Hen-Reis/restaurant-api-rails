class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  accepts_nested_attributes_for :order_products

  validates_associated :order_products

  before_validation :set_delivery_price
  before_validation :set_price

  private

  def set_delivery_price
    self.delivery_price = 3.50
  end

  def set_price
    final_price = 0

    order_products.each do |op|
      final_price += op.quantity * op.product.price
    end

    self.total_price = final_price + self.delivery_price
  end
end
