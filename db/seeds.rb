# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now
  )
end
users = User.all

15.times do
  Topic.create!(
    user: users.sample,
    title: Faker::String.random(3..12)
  )
end
topics = Topic.all

20.times do
  Bookmark.create!(
    topic: topics.sample,
    url:   Faker::Internet.url
  )
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
