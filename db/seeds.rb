require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users using faker
User.destroy_all

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


# Create tours
Tour.destroy_all

users = User.all
users.each do |user|
  title = Faker::BossaNova.song
  language = "English"
  duration = 7200
  price = 100
  date = Faker::Date.between(from: '2022-02-23', to: '2022-03-25')
  user_id = user.id
  tour = Tour.new({
    title: title,
    duration: duration,
    language: language,
    price: price,
    date: date,
    user_id: user_id
  })
  tour.save
  puts "Created tour with the title: #{tour.title}, at #{tour.date}. 🌱"
end
