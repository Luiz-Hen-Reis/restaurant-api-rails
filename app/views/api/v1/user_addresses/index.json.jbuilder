json.addresses @addresses.each do |address|
  json.id address.id
  json.user address.user_id
  json.street address.street
  json.street_number address.street_number
  json.zipcode address.zipcode
  json.district address.district
end
