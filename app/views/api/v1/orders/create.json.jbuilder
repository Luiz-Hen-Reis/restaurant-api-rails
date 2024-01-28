json.id @order.id
json.user_id @order.user_id
json.payment_method @order.payment_method
json.payment_cash_return @order.payment_cash_return
json.delivery_price @order.delivery_price
json.total_price @order.total_price
json.order_date @order.order_date

json.products @order.order_products do |order_product|
  json.id order_product.product.id
  json.name order_product.product.name
  json.category order_product.product.category.name
  json.price order_product.product_price
  json.quantity order_product.quantity
end
