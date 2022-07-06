puts "🗑  Deleting previous Lists & Items"
Item.destroy_all
List.destroy_all

puts "🗒 Creating list"
grocery_list = List.create!(name: "Groceries")

puts "🍎 Adding Items"

10.times { Item.create!(name: Faker::Food.ingredient, list: grocery_list) }
2.times { Item.create!(name: Faker::Food.ingredient, list: grocery_list, done: true) }

puts "✅ All done"