json.extract! @category, :id, :name

json.products @category.products do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
end
