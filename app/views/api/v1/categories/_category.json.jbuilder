json.category_id category.id
json.category_name category.name

json.products category.products do |product|
  json.partial! 'api/v1/products/product', product: product
end
