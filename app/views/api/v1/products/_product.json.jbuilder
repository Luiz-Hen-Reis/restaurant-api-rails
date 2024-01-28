json.id product.id
json.name product.name
json.price product.price
json.description product.description

json.image_url url_for(product.image) if product.image.attached?
