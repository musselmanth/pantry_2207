class CookBook

  attr_reader :recipes,
              :date

  def initialize
    @recipes = []
    @date = Time.now.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe| 
      recipe.ingredients.map{ |ingredient| ingredient.name }
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by{ |recipe| recipe.total_calories }
  end

  def summary
    @recipes.map do |recipe|
      {
        name: recipe.name,
        details: {
          ingredients: recipe.caloricly_sorted_ingredients_req.map do |ingredient, qty|
            {
              ingredient: ingredient.name,
              amount: "#{qty} #{ingredient.unit}"
            }
          end,
          total_calories: recipe.total_calories
        }
      }
    end
  end

end
