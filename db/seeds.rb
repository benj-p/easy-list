puts "🗑  Deleting previous Grocery Items"
GroceryItem.destroy_all

puts "🍎 Adding Grocery Items"

10.times { GroceryItem.create!(name: Faker::Food.ingredient) }
2.times { GroceryItem.create!(name: Faker::Food.ingredient, is_needed: false) }

puts "✅ All done"