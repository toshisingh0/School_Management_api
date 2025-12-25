# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create some sample schools first, as courses need a school_id
school_1 = School.create!(name: "General Assembly", address: "New York")
school_2 = School.create!(name: "Codecademy", address: "Online")

# Now create courses using the school IDs
Course.create!(
  name: "Advanced Rails",
  description: "API Development",
  school_id: school_1.id
)

Course.create!(
  name: "Intro to SQL",
  description: "Database fundamentals",
  school_id: school_2.id
)

puts "Database seeded successfully with courses and schools!"
