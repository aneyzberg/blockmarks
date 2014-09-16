require 'faker'



5.times do
Topic.create!(
  name: Faker::Lorem.word
  )
end
topics = Topic.all


10.times do
Bookmark.create!(
  topics: topics.sample,
  url: Faker::Internet.url
  )
end


puts "Seed Finished"
puts "#{Bookmark.count} urls created"
puts "#{Topic.count} topics created"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
