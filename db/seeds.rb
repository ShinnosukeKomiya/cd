#30.times do |n|
#  id = 1+n
#  num = rand(10..100)
#  Stock.create!(
#    id: id,
#    num: num
#  )
#end

#30.times do |n|
#  id = 1+n
#  title = Faker::Music.album
#  artist = Faker::Music.band
#  price = rand(1000..3000)
#  genre_id = rand(1..5)
#  icon = "cd#{n+1}.png"
#  stock_id = 1+n
#  Cd.create!(
#    id: id,
#    title:  title,
#    artist:  artist,
#    price:  price,
#    genre_id: genre_id,
#    icon: icon,
#    stock_id: stock_id
#  )
#end

30.times do |n|
  id = 1+n
  cd_id = rand(1..30)
  quantity = rand(1..10)
  order_id = rand(1..50000)
  user_id = rand(1..50)
  Cartitem.create!(
    id: id,
    cd_id: cd_id,
    quantity: quantity,
    order_id: order_id,
    user_id: user_id
  )
end

#30.times do |n|
#  id = 1+n
#  cd_id = rand(1..30)
#  user_id = rand(1..100000)
#  Fav.create!(
#    id: id,
#    cd_id: cd_id,
#    user_id:  user_id,
#  )
#end


#1000.times do |n|
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
