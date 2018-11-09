# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro repudiandae obcaecati nostrum fuga, quo quas voluptatem, tempora quam officia pariatur dolores minus magni fugit debitis repellat praesentium cupiditate at! Sequi.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet laborum aliquid obcaecati officia, debitis minima voluptatem vitae aliquam quibusdam nulla itaque molestiae ipsa nam sunt, iusto! Natus, consequatur! Accusamus, perferendis?Lorem ipsum dolor sit amet, consectetur adipisicing elit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro repudiandae obcaecati nostrum fuga, quo quas voluptatem, tempora quam officia pariatur dolores minus magni fugit debitis repellat praesentium cupiditate at! Sequi.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet laborum aliquid obcaecati officia, debitis minima voluptatem vitae aliquam quibusdam nulla itaque molestiae ipsa nam sunt, iusto! Natus, consequatur! Accusamus, perferendis?Lorem ipsum dolor sit amet, consectetur adipisicing elit."

300.times do |t|
password = Faker::Internet.password(64)

u = User.create(
  email: Faker::Internet.email,
  password: password,
  password_confirmation: password,
  user_name: Faker::Internet.username(8),
  confirmed_at: DateTime.now
)

Contact.create!(
	address: Faker::Address.street_address,
	city: Faker::Address.city,
	zip_code: Faker::Address.zip_code,
	country: Faker::Address.country_code,
	company_description: lorem,
	phone_number: Faker::PhoneNumber.phone_number,
	user_id: t+1
)
end


Category.create!(name: "Pharmacy")
Category.create!(name: "Cosmetics")
Category.create!(name: "Fuels")
Category.create!(name: "Agligature")
Category.create!(name: "Raw materials")
Category.create!(name: "Clothers")
Category.create!(name: "Electronics")
Category.create!(name: "Toys")
Category.create!(name: "Machinery")


5000.times do |p|
@user   = User.find(rand(1..User.count))
Lead.create!(
	title: "Lead Number #{p+1}",
	description:    lorem,
	lead_status:    rand(2) == 1 ? "offer" : "product",
	contact_person: @user.user_name,
	address:        Faker::Address.street_address,
	city:           Faker::Address.city,
	zip_code:       Faker::Address.country_code,
	country:        Faker::Address.country_code,
	home_page:      "https://www.google.com/",
	phone_number:   Faker::PhoneNumber.phone_number,
	email:          @user.email,
	created_at:     DateTime.now,
	updated_at:     DateTime.now,
	category_id:    Category.find(rand(1..Category.count)).id,
	user_id:        @user.id
)
puts "Lead number #{p} created"
end 
