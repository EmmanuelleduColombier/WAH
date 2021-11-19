# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

User.destroy_all
Booking.destroy_all
Flat.destroy_all

counter = 0
10.times do
  email = Faker::Internet.email
  last_name = Faker::Name.last_name
  first_name = Faker::Name.first_name
  password = "123456"
  user = User.create(email: email, last_name: last_name, first_name: first_name, password: password)
  file = URI.open(Cloudinary::Uploader.upload('https://source.unsplash.com/collection/4389261/1600x900')['secure_url'])
  user.photo.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')

  p "user ok"
  address = ["38 rue Ramey Paris", "39 avenue Mozart Paris", "17 villa Gaudelet Paris", "2 rue Doudeauville Paris", "14 rue de Vaucouleurs Paris", "84 boulevard Ornano Paris", "45 rue Pouchet Paris", "2 rue Montmartre Paris", "8 rue Victor Letalle Paris", "25 rue de Courcelles"]
  title = ["Very nice desk in Paris!", "Lovely flat and nice co-worky", "Come to my place!", "Proper desk and hot coffee", "Room and fun!", "This is my nice flat", "Very good wifi and a green garden", "Peaceful area with nice host", "Funny atmosphere with a lot of pros", "quiet flat near restaurants"]
  persons = rand(1..10)
  price = rand(10..30)
  description = Faker::Lorem.paragraph
  flat = Flat.create(title: title[counter % title.size], address: [counter % address.size], persons: persons, price: price, description: description, user: user)

  p "flat ok"
  4.times do
    file = URI.open(Cloudinary::Uploader.upload('https://source.unsplash.com/collection/1118894/1600x900')['secure_url'])
    flat.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
    p "photo ok"
  end

  start_date = Faker::Date.between(from: Date.today, to: '2022-12-31')
  end_date = Faker::Date.between(from: start_date, to: '2022-12-31')
  comments = Faker::Lorem.paragraph
  booking = Booking.create(start: start_date, end: end_date, comments: comments, user: user, flat: flat)
  p "booking ok"

  content = Faker::Lorem.paragraph
  rating = rand(1..5)
  if Review.create(content: content, rating: rating, booking: booking)
    flat.update(rating: flat.average_rating)
  end

  p "1 round done 🚀"
  counter += 1
end
