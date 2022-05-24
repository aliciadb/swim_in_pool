# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Create pools database"
Pool.delete_all
User.delete_all

10.times do
  user = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "123456"
  )
end

puts "Creating pools..."
100.times do
  pool = Pool.create(
    name: Faker::TvShows::TwinPeaks.location,
    rating: rand(1.0..5.0).round(1),
    description: Faker::Restaurant.description,
    price: rand(20.0..50.0).round(1),
    location: Faker::Address.street_address,
    image: "https://images.unsplash.com/photo-1536745511564-a5fa6e596e7b?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=992",
    category: %w[jacuzzi olympic slides wavepool indoor outdoor natural infinity lap heated salty kids\ friendly].sample,
    user_id: rand(1..10)
  )
  puts "#{pool.name} - #{pool.category} | Price: #{pool.price}"
end
