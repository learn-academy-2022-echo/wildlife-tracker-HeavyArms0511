require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without a valid latitude' do
    sighting = Sighting.create animal_id:1, latitude: nil, longitude: "234234.333", date: 990909
    expect(sighting.errors[:latitude]).to_not be_empty
  end
  it 'is not valid without a valid longitude' do
    sighting = Sighting.create animal_id:1, latitude: "324.3333", longitude: nil, date: 990909
    expect(sighting.errors[:longitude]).to_not be_empty
  end
  it 'is not valid without a valid date' do
    sighting = Sighting.create animal_id:1, latitude: "324.3333", longitude: "323.333434", date: nil
    expect(sighting.errors[:date]).to_not be_empty
  end
end