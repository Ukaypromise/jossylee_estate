# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 20 sample properties with images
20.times do |i|
  property = Property.create(
    name: "Property #{i + 1}",
    description: "Description for Property #{i + 1}",
    property_type: "Residential",
    location: "Location #{i + 1}",
    price: 150000 + (i * 1000),  # Adjust the prices as needed
    plot_size: 1200 + (i * 100), # Adjust the plot sizes as needed
    property_status: "For Sale",
    availability: Date.today + (i * 5), # Adjust availability dates as needed
    owner_agent: "Real Estate Agency",
    # user: user, # Associate the property with the user
  )
end
