json.orders @orders do |order|
  json.id order.id
  json.payment_method order.payment_method
  json.payment_cash_return order.payment_cash_return
  json.delivery_price order.delivery_price
  json.subtotal order.subtotal
  json.order_date order.order_date
end
