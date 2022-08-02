class Recipe

  attr_reader :ingredients_required,
              :name

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, qty)
    @ingredients_required[ingredient] += qty
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.sum{ |ingredient, qty| ingredient.calories * qty }
  end

  def caloricly_sorted_ingredients_req
    @ingredients_required.sort_by{ |ingredient, qty| -ingredient.calories * qty }.to_h
  end

end
