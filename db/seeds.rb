require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Tour.destroy_all

# Create users using faker
10.times do |_n|
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

# Create tours
users = User.all
users.each do |user|
  6.times do |_n|
    title = Faker::BossaNova.song
    language = "English"
    duration = 7200
    price = 100
    date = Faker::Date.between(from: '2022-02-23', to: '2022-03-25')
    start_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
    location = Faker::Address.city
    user_id = user.id
    tour = Tour.new({
      title: title,
      duration: duration,
      language: language,
      location: location,
      start_time: start_time,
      price: price,
      date: date,
      user_id: user_id
    })
    tour.save
    puts "Created tour with the title: #{tour.title}, at #{tour.date}. 🌱"
  end
end

10.times do |_n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "test1234"
  user = User.new({first_name: first_name, last_name: last_name, email: email, password: password})
  user.save
  user.errors.messages
  puts "We just created #{user.first_name} 🌱"
end
