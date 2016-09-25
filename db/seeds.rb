# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
end


100.times do |n|
  title = Faker::Name.title
  content = Faker::Lorem.paragraph
  user_id = Faker::Number.between(1, 100)
  Picture.create!(title: title, content: content, user_id: user_id)
end
