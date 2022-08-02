require './lib/cook_book'
require './lib/recipe'

RSpec.describe CookBook do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook = CookBook.new
  end

  it 'exists' do
    expect(@cookbook).to be_an(CookBook)
  end

  it 'starts with no recipes but can have them added' do
    expect(@cookbook.recipes).to eq([])

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end

  context 'ingredients and highest_calorie_meal' do
    before(:each) do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
    end

    it 'can list ingredients' do
      expected = ["Cheese", "Macaroni", "Ground Beef", "Bun"]
      expect(@cookbook.ingredients).to eq(expected)
    end

    it 'can return the highest calorie meal' do
      expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
    end

  end

end