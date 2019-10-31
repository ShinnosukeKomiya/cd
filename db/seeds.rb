40000.times do |n|
  cd_id = rand(1..100000)
  user_id = rand(1..100000)
  Fav.create!(
    cd_id: cd_id,
    user_id:  user_id,
  )
end


#100000.times do |n|
#  id = 1+n
#  name  = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  admin = 0
#  address = Faker::Address.city
#  User.create!(
#    id: id,
#    name:  name,
#    email: email,
#    password:password,
#    admin: admin,
#    address: address
#  )
#end
#50000.times do |n|
#  id = 1+n
#  user_id = rand(1..100000)
#  total = rand(1000..20000)
#  Order.create!(
#    id: id,
#    user_id: user_id,
#    total: total
#  )
#end
#5.times do |n|
#  id = 1+n
#  genre = Faker::Music.genre
#  Genre.create!(
#    id: id,
#    genre:  genre,
#  )
#end

#100000.times do |n|
#  title = Faker::Music.album
#  artist = Faker::Music.band
#  price = rand(1000..3000)
#  genre_id = rand(1..5)
#  Cd.create!(
#    title:  title,
#    artist:  artist,
#    price:  price,
#    genre_id: genre_id
#  )
#end

#50000.times do |n|
#  cd_id = rand(1..100000)
#  quantity = rand(1..10)
#  price = rand(1000..2000)
#  order_id = rand(1..50000)
#  Cartitem.create!(
#    cd_id: cd_id,
#    quantity: quantity,
#    price: price,
#    order_id: order_id
#  )
#end
