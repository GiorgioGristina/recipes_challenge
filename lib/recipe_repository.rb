require_relative './recipe'


class RecipeRepository
    
    def all
        recipes = []
        sql = 'SELECT * FROM recipes;'
        result = DatabaseConnection.exec_params(sql, [])
        result.each do |record|
            recipe = Recipe.new
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.cooking_time = record['cooking_time'].to_i
            recipe.rating = record['rating'].to_i
            recipes << recipe
        end
        return recipes
    end

    def find(id)
        sql = 'SELECT * FROM recipes WHERE id = $1'
        result = DatabaseConnection.exec_params(sql, [id])
        recipe = Recipe.new
        data = result[0]
        recipe.id = data['id']
        recipe.name = data['name']
        recipe.cooking_time = data['cooking_time'].to_i
        recipe.rating = data['rating'].to_i
        return recipe
    end
end