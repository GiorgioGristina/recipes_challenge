# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes')

recipes = RecipeRepository.new

recipes.all.each do |recipe|
    puts "- #{recipe.name} cooking time: #{recipe.cooking_time} rating: #{'⭐️' * recipe.rating}"
end
