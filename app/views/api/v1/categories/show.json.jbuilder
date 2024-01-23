json.extract! @category, :id, :name

json.products @category.products do |product|
  json.partial! 'api/v1/products/product', product: product
end
