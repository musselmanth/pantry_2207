require './lib/recipe'
require './lib/ingredient'


RSpec.describe Recipe do
  let(:ingredient1){Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2){Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:recipe1){Recipe.new("Mac and Cheese")}

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

end