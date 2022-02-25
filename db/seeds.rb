require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Tour.destroy_all
User.destroy_all

ADDRESSES = [
  "Wielingenstraat 16, 1078 Amsterdam",
  "Amstelveenseweg 91, 1075 Amsterdam",
  "Buikslotermeerplein 2003, 1025 Amsterdam",
  "Herenstraat 25, 1211 Hilversum",
  "Keplerlaan 3, 2201 Noordwijk",
  "Bergweg 82A, 3036 Rotterdam",
  "Noordkade 3, 2371 Roelofarendsveen",
  "Radonweg 6 Kantoor, 3542 Utrecht",
  "Stationsstraat 75, 3811 Amersfoort",
  "Rue Sainte-Catherine 37, 1000 Bruxelles",
  "11 White's Row, London",
  "Buitenhof 46, 2513 Den Haag",
  "Södra Vägen 54, 412 54 Göteborg"
]

TOUR_NAMES = [
  "City tour",
  "Gastronomic round tour",
  "City hike around monuments",
  "Local bar crawl",
  "Trekking in the dunes",
  "Beach sightseeing",
  "Dunes survival camp",
  "Desert experience",
  "Rainy day experience",
  "Surf camp"
]

# Create users using faker
5.times do |_n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  picture = 'https://picsum.photos/200'
  password = "test1234"
  age = Faker::Number.between(from: 18, to: 70)
  description = Faker::Movies::Lebowski.quote
  user = User.new({first_name: first_name, last_name: last_name, email: email, password: password, picture: picture, age: age, description: description})
  user.save
  user.errors.messages
  puts "We just created #{user.first_name} 🌱"
end

first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
email = "test@email.com"
picture = 'https://picsum.photos/200'
password = "test1234"
age = Faker::Number.between(from: 18, to: 70)
description = Faker::Movies::Lebowski.quote
user = User.new({first_name: first_name, last_name: last_name, email: email, password: password, picture: picture, age: age, description: description})
user.save
user.errors.messages
puts "We just created Test email with name -> #{user.first_name} 🌱"

# Create tours
users = User.all
number = 0
users.each do |user|
  2.times do
    title = TOUR_NAMES[rand(10)]
    language = "English"
    duration = 7200
    price = rand(250)
    date = Faker::Date.between(from: '2022-02-26', to: '2022-03-25')
    start_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
    address = ADDRESSES[number]
    number += 1
    picture = 'https://picsum.photos/400/400'
    user_id = user.id
    description = Faker::Lorem.sentence(word_count: 30)
    tour = Tour.new({
      title: title,
      duration: duration,
      language: language,
      description: description,
      address: address,
      start_time: start_time,
      price: price,
      date: date,
      user_id: user_id
    })
    4.times do |_m|
      picture = Picture.new({image: 'https://picsum.photos/400/400'})
      picture.tour = tour
      picture.save
    end
    tour.save!
    p "User: #{user.first_name} | Tour title: #{tour.title}, at #{tour.date}, Address: #{tour.address} 🌱"
  end
end

@tours = Tour.all
10.times do |_n|
  tour = @tours[rand(0..9)]
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "test1234"
  user = User.new({first_name: first_name, last_name: last_name, email: email, password: password})
  user.save
  user.errors.messages
  booking = Booking.new({user_id: user.id, tour_id: tour.id})
  booking.save!
  puts "We just created #{user.first_name} | And made a booking: #{booking.id} 🌱"
end

test_user = User.where("email = 'test@email.com'")[0]
# puts test_user.email
last_tour = Tour.last
last_tour.user_id = test_user.id
last_tour.save
Booking.create({user_id: user.id, tour_id: last_tour.id})
booking_test = Booking.where("user_id = #{test_user.id}")
puts "Booking created or test_user - #{test_user.first_name} - #{test_user.email} | #{booking_test}"
