# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(5).times do |i|
  user = User.new(email: "test#{i}@example.com", password: "123456" )
  user.encrypted_password = "#$taawktljasktlw4aaglj#{i}"
  user.save!
end

(5).times do |i|
  item = Item.new(name: "MTX Bike", category: "Biking", description: "heavy pleasure", location: "Munich", price_per_day: 15)
  item.user = User.find(i+1)
  item.save
end
