require './lib/recipe'
require './lib/ingredient'


RSpec.describe Recipe do
  let(:ingredient1){Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2){Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3){Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4){Ingredient.new({name: "Bun", unit: "g", calories: 75})}
  let(:recipe1){Recipe.new("Mac and Cheese")}
  let(:recipe2){Recipe.new("Cheese Burger")}

  it 'exists and has a name' do
    expect(recipe1).to be_an(Recipe)
    expect(recipe1.name).to eq("Mac and Cheese")
  end

  it 'starts with no ingredients required' do
    expect(recipe1.ingredients_required).to eq({})
  end

  it 'can have ingredients added to it' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expected = {
      ingredient1 => 6,
      ingredient2 => 8
    }

    expect(recipe1.ingredients_required).to eq(expected)
  end

  it 'can list only the ingredients without amounts' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expected = [ingredient1, ingredient2]

    expect(recipe1.ingredients).to eq(expected)
  end

  it 'can calorize' do
    recipe1.add_ingredient(ingredient2, 8)
    recipe1.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    expect(recipe1.total_calories).to eq(440)
    expect(recipe2.total_calories).to eq(675)
  end

end