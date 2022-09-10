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
end

