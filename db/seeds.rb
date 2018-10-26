# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = Faker::Internet.password(64)

u = User.create(
  email: Faker::Internet.email,
  password: password,
  password_confirmation: password,
  user_name: Faker::Internet.username(8)
)


Category.create(name: "Pharmacy")
Category.create(name: "Cosmetics")
Category.create(name: "Fuels")
Category.create(name: "Agligature")
Category.create(name: "Raw materials")
Category.create(name: "Clothers")
Category.create(name: "Electronics")
Category.create(name: "Toys")
Category.create(name: "Machinery")



