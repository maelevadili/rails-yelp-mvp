# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Restaurant.destroy_all

puts 'Creating 25 fake restaurants...'
25.times do
  restaurant = Restaurant.new(
    name:         Faker::Restaurant.name,
    address:      "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category:     %w(chinese italian japanese french belgian).sample
  )
  restaurant.save!
end
puts 'Finished!'

puts 'Creating 150 fake restaurant reviews...'
150.times do
  review = Review.new(
    content:       Faker::Restaurant.review,
    rating:        [1, 2, 3, 4, 5].sample,
    restaurant_id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25].sample
  )
  review.save!
end
puts 'Finished!'
