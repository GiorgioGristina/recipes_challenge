require 'recipe_repository'

def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipe.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_test' })
    connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do


    before(:each) do 
        reset_recipes_table
    end

    it "return a list of recipes" do
        repo = RecipeRepository.new

        recipes = repo.all

        expect(recipes.length).to eq(3)  
        expect(recipes.first.name).to eq('lasagna')  
        expect(recipes.first.cooking_time).to eq(120)
        expect(recipes.first.rating).to eq(5)  

    end

    it "return the recipes with id 1" do
        repo = RecipeRepository.new

        recipe = repo.find(1)        
        expect(recipe.name).to eq('lasagna')  
        expect(recipe.cooking_time).to eq(120)
        expect(recipe.rating).to eq(5)  

    end
end

