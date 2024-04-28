require 'open-uri'

Category.destroy_all
Product.destroy_all

puts "Creating Categories"

temakis = Category.create(name: "Temakis")
temakis.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/temaki.jpg'), filename: "temaki.jpg")

pokes = Category.create(name: "Pokes")
pokes.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

hossomakis = Category.create(name: "Hossomakis")
hossomakis.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/hossomaki.jpg'), filename: "hossomaki.jpg")

uramakis = Category.create(name: "Uramakis")
uramakis.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/uramaki.jpg'), filename: "uramaki.jpg")

entradas = Category.create(name: "Entradas")
entradas.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/sashimi.jpg'), filename: "sashimi.jpg")

puts "Creating products"

temaki_skin = Product.create(name: "Skin", category: temakis, price: 16.90, description: "Pele do salmão grelhada processada misturada ao teriyaki gergelim, cebolinha e arroz.")
temaki_skin.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/temaki.jpg'), filename: "temaki.jpg")

temaki_california = Product.create(name: "California", category: temakis, price: 17.90, description: "Salmão, pepino e Kani Kama.")
temaki_california.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/temaki.jpg'), filename: "temaki.jpg")

temaki_salmon_philadelphia = Product.create(name: "Salmão Philadelphia", category: temakis, price: 18.90, description: "Salmão, Cream Cheese Philadelphia.")
temaki_salmon_philadelphia.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/temaki.jpg'), filename: "temaki.jpg")

temaki_hot = Product.create(name: "Hot", category: temakis, price: 18.90, description: "Temaki de salmão empanado e frito.")
temaki_hot.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/temaki.jpg'), filename: "temaki.jpg")

poke_aloha = Product.create(name: "Aloha", category: pokes, price: 29.90, description: "Arroz, cebola morada, castanha de caju, Kani Kama, cream cheese, chips, cenoura, salmão e molho clássico.")
poke_aloha.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

poke_oahu = Product.create(name: "Oahu", category: pokes, price: 29.90, description: "Arroz, cebola morada, pepino, Kani Kama, chips, cenoura, abacaxi, tomate, salmão e molho tarê.")
poke_oahu.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

poke_hawaii = Product.create(name: "Hawaii", category: pokes, price: 29.90, description: "Arroz, pepino, Nori, abacaxi, cebola morada, cream cheese, abacate, salmão e molho tarê.")
poke_hawaii.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

poke_hilo = Product.create(name: "Hilo", category: pokes, price: 29.90, description: "Arroz, pepino, batata-doce, cebola morada, cream cheese, tomate, cenoura, salmão e molho tarê.")
poke_hilo.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

poke_kapaa = Product.create(name: "Kapaa", category: pokes, price: 29.90, description: "Alface, sunomono, cebola morada, cream cheese, tomate, salmão e molho tarê.")
poke_kapaa.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

poke_hana = Product.create(name: "Hana", category: pokes, price: 29.90, description: "Arroz + folhas, batata, batata-doce, cream cheese, tomate, cenoura, sunomono, salmão e molho tarê.")
poke_hana.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/poke.jpg'), filename: "poke.jpg")

hossomaki_kappamaki = Product.create(name: "Kappamaki", category: hossomakis, price: 15.50, description: "8 Unidades.")
hossomaki_kappamaki.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/hossomaki.jpg'), filename: "hossomaki.jpg")

hossomaki_kanimaki = Product.create(name: "Kanimaki", category: hossomakis, price: 16.50, description: "8 Unidades.")
hossomaki_kanimaki.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/hossomaki.jpg'), filename: "hossomaki.jpg")

hossomaki_sakemaki = Product.create(name: "Sakemaki", category: hossomakis, price: 18.90, description: "8 Unidades.")
hossomaki_sakemaki.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/hossomaki.jpg'), filename: "hossomaki.jpg")

hossomaki_ebimaki = Product.create(name: "Ebimaki", category: hossomakis, price: 19.90, description: "8 Unidades.")
hossomaki_ebimaki.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/hossomaki.jpg'), filename: "hossomaki.jpg")

uramaki_california_roll = Product.create(name: "California Roll", category: uramakis, price: 20.99, description: "8 Unidades.")
uramaki_california_roll.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/uramaki.jpg'), filename: "uramaki.jpg")

uramaki_salmon_skin_roll = Product.create(name: "Salmon Skin Roll", category: uramakis, price: 20.99, description: "8 Unidades.")
uramaki_salmon_skin_roll.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/uramaki.jpg'), filename: "uramaki.jpg")

uramaki_sake_roll = Product.create(name: "Sake Roll", category: uramakis, price: 21.99, description: "8 Unidades.")
uramaki_sake_roll.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/uramaki.jpg'), filename: "uramaki.jpg")

uramaki_spice_roll = Product.create(name: "Spice Roll", category: uramakis, price: 21.99, description: "8 Unidades.")
uramaki_spice_roll.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/uramaki.jpg'), filename: "uramaki.jpg")

entrada_harumaki = Product.create(name: "Harumaki", category: entradas, price: 12.90, description: "Harumaki de carne (4 unidades).")
entrada_harumaki.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/harumaki.jpg'), filename: "harumaki.jpg")

entrada_ceviche = Product.create(name: "Ceviche de salmão", category: entradas, price: 26.90, description: "Ceviche de salmão.")
entrada_ceviche.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/ceviche.jpg'), filename: "ceviche.jpg")

entrada_ceviche_frutos_do_mar = Product.create(name: "Ceviche de frutos do mar", category: entradas, price: 29.99, description: "Ceviche de frutos do mar.")
entrada_ceviche_frutos_do_mar.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/ceviche.jpg'), filename: "ceviche.jpg")

entrada_sunomono = Product.create(name: "Sunomono", category: entradas, price: 14.99, description: "Salada de pepinos agridoce.")
entrada_sunomono.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/sunomono.jpg'), filename: "sunomono.jpg")

entrada_hotroll = Product.create(name: "Hot Roll", category: entradas, price: 27.99, description: "12 unidades.")
entrada_hotroll.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/hotroll.jpg'), filename: "hotroll.jpg")

entrada_sashimi = Product.create(name: "Sashimi", category: entradas, price: 16.90, description: "8 unidades.")
entrada_sashimi.image.attach(io: URI.open('https://my-restaurant-api-bucket.s3.sa-east-1.amazonaws.com/sashimi.jpg'), filename: "sashimi.jpg")
