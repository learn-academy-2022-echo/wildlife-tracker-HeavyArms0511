require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without a valid common_name' do
    animal = Animal.create common_name:nil, scientific_binomial: 'Duckus birdus'
    expect(animal.errors[:common_name]).to_not be_empty
  end

  it 'is not valid without a valid common_name' do
    animal = Animal.create common_name:"duck", scientific_binomial: nil
    expect(animal.errors[:scientific_binomial]).to_not be_empty
  end
  it 'is not valid if common_name and scientific_binomial are the same' do
    animal =  Animal.create common_name:"Duck", scientific_binomial:"Duck"
    expect(animal.errors[:common_name]).to_not equal([:scientific_binomial])
  end
  it 'is not valid if common_name is not uniqute' do
    Animal.create common_name:"Donkey", scientific_binomial:"Equus asinus"
    animal = Animal.create common_name:"Donkey", scientific_binomial:"Equus asinus"
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if scientific_binomial is not uniqute' do
    Animal.create common_name:"Donkey", scientific_binomial:"Equus asinus"
    animal = Animal.create common_name:"Donkey", scientific_binomial:"Equus asinus"
    expect(animal.errors[:scientific_binomial]).to_not be_empty
  end
end

