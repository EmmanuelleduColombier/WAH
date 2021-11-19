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

user_one = User.create(email: "t@g.com", last_name: "TRUC", first_name: "Michel", password: "123456")
user_two = User.create(email: "e@g.com", last_name: "MACHIN", first_name: "Paula", password: "123456")
user_three = User.create(email: "b@g.com", last_name: "BIDULE", first_name: "Jean", password: "123456")

flat_one = Flat.create(title: "Very nice desk in Paris!", address: "38 rue Ramey Paris", room_type: "shared desk in living room", persons: 2, price: 15, description: "I have two desk to share for good cowork", user: user_one)
flat_two = Flat.create(title: "A good spot for team work", address: "16 villa Gaudelet Paris", room_type: "A beautiful loft", persons: 5, price: 25, description: "Many tables avaible for studdy and work", user: user_one)
flat_three = Flat.create(title: "Take it easy", address: "39 avenue Mozart Paris", room_type: "Living room", persons: 1, price: 30, description: "Home office with me ?", user: user_one)
flat_four = Flat.create(title: "Nice flat for work", address: "2 rue Doudeauville Paris", room_type: "Your own desk", persons: 3, price: 20, description: "I have three desk to share", user: user_one)
flat_five = Flat.create(title: "Paris with nice view", address: "39 rue Miromesnil Paris", room_type: "shared desk in living room", persons: 7, price: 40, description: "Come make your TAD in our rooftop", user: user_one)
flat_six = Flat.create(title: "Come work at home", address: "38 rue Ramey Paris", room_type: "Two places in my livign", persons: 2, price: 15, description: "I have two desk to share for good cowork", user: user_one)
flat_seven = Flat.create(title: "Work with us", address: "12 rue Montmartre Paris", room_type: "Kitchen", persons: 2, price: 20, description: "Good place to work and cook", user: user_two)
flat_eight = Flat.create(title: "Take your work with you", address: "2 rue de Nice Paris", room_type: "", persons: 2, price: 15, description: "I have two desk to share for good cowork", user: user_one)
flat_nine = Flat.create(title: "Very nice desk in Paris!", address: "38 rue Ramey Paris", room_type: "shared desk in living room", persons: 2, price: 15, description: "I have two desk to share for good cowork", user: user_one)




10.times do
  # email = Faker::Internet.email
  # last_name = Faker::Name.last_name
  # first_name = Faker::Name.first_name
  # password = "123456"

  address = ["38 rue Ramey Paris", "39 avenue Mozart Paris", "17 villa Gaudelet Paris", "2 rue Doudeauville Paris", "14 rue de Vaucouleurs Paris", "84 boulevard Ornano Paris", "45 rue Pouchet Paris", "2 rue Montmartre Paris", "8 rue Victor Letalle Paris", "25 rue de Courcelles"]
  title = "Very nice desk in Paris!"
  room_type = "shared desk space in living room"
  persons = rand(1..10)
  price = rand(10..30)
  description = Faker::Lorem.paragraph
  flat = Flat.create(title: title, address: address.sample, room_type: room_type, persons: persons, price: price, description: description, user: user)

  start_date = Faker::Date.between(from: Date.today, to: '2022-12-31')
  end_date = Faker::Date.between(from: start_date, to: '2022-12-31')
  comments = Faker::Lorem.paragraph
  Booking.create(start: start_date, end: end_date, comments: comments, user: user, flat: flat)
end
