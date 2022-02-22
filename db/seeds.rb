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


1.times do |_n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 8)
  user = User.new({first_name: first_name, last_name: last_name, })
  user.save
  user.error.messages
  puts "We just created #{user.first_name} 🌱"
end
