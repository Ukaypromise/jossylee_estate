# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create a default user
user_one = User.create(
  email: "promiseuka@gmail.com",
  first_name: "Promise",
  last_name: "Uka",
  password: "password",
  password_confirmation: "password",
  role: "admin",
  confirmed_at: Time.now,
)

user_two = User.create(
  email: "brightmicheal21@gmail.com",
  first_name: "Bright",
  last_name: "Michael",
  password: "password",
  password_confirmation: "password",
  role: "admin",
  confirmed_at: Time.now,
)

user_three = User.create(
  email: "bright@gmail.com",
  first_name: "Bright",
  last_name: "Michael",
  password: "password",
  password_confirmation: "password",
  role: "customer",
  confirmed_at: Time.now,
)

# Create 20 sample properties with images
10.times do |i|
  property = Property.create(
    name: "5 Bedroom Bungalow #{i + 1}",
    description: "This spacious 5-bedroom bungalow offers the perfect blend of comfort and style. With a total area of 2000 square feet, this home provides ample living space for a family. The property is located in a serene neighborhood, offering a peaceful and secure environment. The bungalow features modern amenities, including a spacious kitchen, a well-manicured garden, and a garage. Don't miss the opportunity to make this beautiful bungalow your new home.",
    property_type: "Residential",
    location: "Lekki, Lagos",
    price: 250000 + (i * 10000),  # Adjust the prices as needed
    plot_size: 1500 + (i * 200), # Adjust the plot sizes as needed
    property_status: "sale",
    availability: Date.today + (i * 7), # Adjust availability dates as needed
    owner_agent: "Your Realty Partner",
    user: user_one, # Associate the property with the user
  )
end
