# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
#User.destroy_all
#Event.destroy_all
#Participation.destroy_all

15.times do
  User.create(first_name: Faker::Creature::Animal.name, last_name: Faker::Name.last_name, email: "#{Faker::Name.last_name}@yopmail.com", encrypted_password: Faker::Dessert.flavor)
  end

10.times do
  Event.create(start_date: Faker::Date.forward(days:60), duration: 15, title: Faker::Science.scientist, description: Faker::Lorem.sentence, price: rand(1..1000), location: Faker::Address.city, admin: User.all[rand(0..14)])
end

15.times do
  Participation.create(stripe_customer_id: Faker::Number.between(from:1, to:15), user: User.all.sample, event: Event.all.sample)
end