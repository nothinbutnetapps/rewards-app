# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ['Action', 'Comedy', 'Drama', 'Horror'].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  'Car',
  'Vacation Package',
  'Gift Card',
  'Smartphone',
  'Laptop',
  'Television',
  'Bicycle',
  'Concert Tickets',
  'Dinner for Two',
  'Spa Day',
  'Home Appliance',
  'Fitness Tracker',
  'Book Collection',
  'Headphones',
  'Gaming Console',
  'Camera',
  'Jewelry',
  'Sports Equipment',
  'Subscription Box',
  'Cash Prize'
].each do |reward| 
  Reward.create(name: reward, price: rand(1..100))
end
