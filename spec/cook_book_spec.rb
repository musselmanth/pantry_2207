require './lib/cook_book'
require './lib/recipe'

RSpec.describe CookBook do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  it 'exists' do
    expect(@cookbook).to be_an(CookBook)
  end

  it 'starts with no recipes but can have them added' do
    expect(@cookbook.recipes).to eq([])

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expect(@cookbook.reciptes).to eq([@recipe1, @recipe2])
  end
  
end