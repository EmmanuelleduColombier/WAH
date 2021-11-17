# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Booking.destroy_all
Flat.destroy_all
User.destroy_all

10.times do
  email = Faker::Internet.email
  last_name = Faker::Name.last_name
  first_name = Faker::Name.first_name
  password = "123456"
  user = User.create(email: email, last_name: last_name, first_name: first_name, password: password)

  title = "Very nice desk in Paris!"
  address = "16 villa Gaudelet Paris"
  room_type = "shared desk space in living room"
  persons = rand(1..10)
  price = rand(10..30)
  description = Faker::Lorem.paragraph
  flat = Flat.create(title: title, address: address, room_type: room_type, persons: persons, price: price, description: description, user: user)

  start_date = Faker::Date.between(from: Date.today, to: '2022-12-31')
  end_date = Faker::Date.between(from: start_date, to: '2022-12-31')
  comments = Faker::Lorem.paragraph
  Booking.create(start: start_date, end: end_date, comments: comments, user: user, flat: flat)
end
