require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
User.destroy_all
City.destroy_all
Gossip.destroy_all
Mark.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all


10.times do |index|
  c = City.create(name: Faker::Nation.capital_city, zip_code: Faker::Code.nric)
  u = User.create(first_name: Faker::Name.name, last_name: Faker::Name.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.between(from: 20, to: 50), city_id: City.all.sample.id, password: "password", password_confirmation: "password")
end

20.times do |index|
  g = Gossip.create(title: Faker::Movies::Hobbit.character, content: Faker::Verb.ing_form, user_id: User.all.sample.id)
end

10.times do |index|
  t = Tag.create(title: Faker::Movie.name)
  m = Mark.create(gossip_id: Gossip.all.sample.id, tag_id: t.id)
end

5.times do |index|
  pm = PrivateMessage.create(content: Faker::Movie.quote, recipient_id: User.all.sample.id, sender_id: User.all.sample.id )
end

10.times do |index|
  co = Comment.create(content: Faker::Movie.quote, user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id )
end

anonymous = User.create(first_name: "Anonymous", last_name: Faker::Name.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.between(from: 20, to: 50), city_id: City.all.sample.id)