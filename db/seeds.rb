# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Create pools database"
Booking.delete_all
Pool.delete_all
User.delete_all

10.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "123456"
  )
end
LOCATIONS = ["Plaça Francesc Macià, 2, 08930, Barcelona, Spain", "Marienstrasse, 9 10117 Berlin, Germany", "Avenue de Tervuren,
             100 Brussels, Belgium", "Agrari, Mikonos 846 00, Greece",
             "Av. Poente 13, 8005-520 Faro, Portugal", "Bias do Sul, 8700, Moncarapacho, Portugal"]
puts "Creating pools..."
40.times do
  pool = Pool.create(
    name: Faker::TvShows::TwinPeaks.location,
    rating: rand(1.0..5.0).round(1),
    description: Faker::Restaurant.description,
    price: rand(20.0..50.0).round(1),
    location: LOCATIONS.sample,
    category: %w[jacuzzi olympic slides wavepool indoor outdoor natural infinity lap heated salty kids\ friendly].sample,
    user: User.all.sample
  )
  puts "#{pool.name} - #{pool.category} | Price: #{pool.price}"
end
