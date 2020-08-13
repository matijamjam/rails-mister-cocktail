require 'net/http'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating cocktails...'
Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'GinTo')
Cocktail.create(name: 'RumCo')
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
puts 'Finished!'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
uri = URI(url)
response = Net::HTTP.get(uri)
drinks_object = JSON.parse(response)
arr_drink = drinks_object['drinks']
arr_drink.each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
