# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "activerecord-reset-pk-sequence"

User.delete_all
User.reset_pk_sequence
City.delete_all
City.reset_pk_sequence
Gossip.delete_all
Gossip.reset_pk_sequence
Tag.delete_all
Tag.reset_pk_sequence
PrivateMessage.delete_all
PrivateMessage.reset_pk_sequence
JoinTableTagGossip.delete_all
JoinTableTagGossip.reset_pk_sequence
LierPrivateMessageUser.delete_all
LierPrivateMessageUser.reset_pk_sequence

#Cities

10.times do
  city_and_zip = Faker::Address.full_address.split(', ').last
  zip = city_and_zip.split(' ').first
  city_name = city_and_zip.split(' ').last
  City.create(name: city_name, zip_code: zip)
end
puts
puts "Cities table"
tp City.all
#Users
adjectifs= %w[petit grand maigre gros chauve muscle intelligent parfait mediocre insupportable eblouissant valeureux]
10.times do 
  first_name = Faker::Name.first_name
  age = rand(18..90)
  city = City.all.sample
  text = "Je m'appelle #{first_name}, je suis #{adjectifs.sample} et mon livre préféré est #{Faker::Book.title}, je suis #{Faker::Job.title} à #{city.name} "
  User.create(first_name: first_name, last_name: Faker::Name.last_name ,description: text, email: Faker::Internet.email, age: age, city: city )

end
puts
puts "Users table"
tp User.all

#Gossips
20.times do 
  Gossip.create(title: Faker::Hipster.word, content: Faker::ChuckNorris.fact, user: User.all.sample )
  
end
puts
puts "Gossips table"
tp Gossip.all

#Tags 
10.times do
  Tag.create(title: Faker::Verb.base)
end
puts
puts "Cities table"
tp Tag.all

Tag.all.each do |t|
  JoinTableTagGossip.create(tag: t, gossip: Gossip.all.sample)
end

Gossip.all.each do |g|
  JoinTableTagGossip.create(tag: Tag.all.sample, gossip: g)
end

puts
puts "JoinTableTagGossip table"
tp JoinTableTagGossip.all

#Private messages
10.times do
  PrivateMessage.create(content:Faker::Lorem.sentence,sender: User.all.sample)
end
puts
puts "Private messages table"
tp PrivateMessage.all

#Lier private_messages_users
User.all.each do |u|
  LierPrivateMessageUser.create(user: u, private_message: PrivateMessage.all.sample)
end

PrivateMessage.all.each do |pm|
  LierPrivateMessageUser.create(user: User.all.sample, private_message: pm)
end

puts
puts "Lier private message et users table"
tp LierPrivateMessageUser.all
