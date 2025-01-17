# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro repudiandae obcaecati nostrum fuga,quo quas voluptatem, tempora quam officia pariatur dolores minus magni fugit debitis repellat praesentium 
cupiditate at! Sequi.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet laborum aliquid obcaecati officia, debitis minima voluptatem vitae aliquam quibusdam nulla itaque molestiae ipsa nam sunt, iusto! 
Natus, consequatur! Accusamus, perferendis?Lorem ipsum dolor sit amet, consectetur adipisicing elit.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
Porro repudiandae obcaecati nostrum fuga, quo quas voluptatem, tempora quam officia pariatur dolores minus magni 
fugit debitis repellat praesentium cupiditate at! Sequi.Lorem ipsum dolor sit amet, consectetur adipisicing elit.
 Amet laborum aliquid obcaecati officia, debitis minima voluptatem vitae aliquam quibusdam nulla itaque molestiae 
 ipsa nam sunt, iusto! Natus, consequatur! Accusamus, perferendis?Lorem ipsum dolor sit amet, 
 consectetur adipisicing elit."

 areas = ["Cosmetics / Body Care", "Agriculture", "Construction Materials", "Office/Packaging Products"]

 freqency = ["Single Delivery", "Once a week", "Once a Month", "Once a Year", "Several Times Per Year", "Another Way"]

 continents = ["Africa", "Asia", "Europe", "South America", "North America", "Australia"]

400.times do |t|
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
	home_page: Faker::Internet.url('trade.com'),
	year_of_establishment: 1990 + rand(29), 
	phone_number: Faker::PhoneNumber.phone_number,
	number_of_employes: rand(500)+1,
	areas_of_interest: areas,
	annual_sales: 5550000,
	user_id: t+1
)
puts "User number #{t} created"
end


Category.create!(name: "Fuels")
Category.create!(name: "Services")
Category.create!(name: "Cosmetics / Body Care")
Category.create!(name: "Groceries / Food")
Category.create!(name: "Mechanic Devices and Parts")
Category.create!(name: "Basic Necessities")
Category.create!(name: "Electronics")
Category.create!(name: "Clothers / Textiles")
Category.create!(name: "Agriculture")
Category.create!(name: "Industrial Goods")
Category.create!(name: "Construction Materials")
Category.create!(name: "Office/Packaging Products")
Category.create!(name: "Home Products")




3000.times do |p|
  @dateOfCreation = Time.current - rand(365).days
  @user  = User.find(rand(1..User.count))

Lead.create!(
	title:              Faker::GreekPhilosophers.quote,
	description:        lorem,
	description_short:  lorem.slice(0..300),
	lead_status:        rand(2) == 1 ? "offer" : "product",
	contact_person:     @user.user_name,
	country:            Faker::Address.country_code,
	phone_number:       Faker::PhoneNumber.phone_number,
	destination:        Faker::University.name,
	quantity:           "50 tonnes",
	freqency:           freqency.sample,
	prefered_suppliers: continents.sample,
	created_at:    	    @dateOfCreation,
	updated_at:    	    @dateOfCreation,
	category_id:        Category.find(rand(1..Category.count)).id,
	user_id:            @user.id
)
puts "Lead number #{p} created"
end 
