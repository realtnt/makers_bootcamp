require 'lost_cat'

RSpec.describe LostCat do
  cat1 = LostCat.new(
    name: 'mumu', 
    description: 'lost cat', 
    mobile: '01234555234', 
    password: 'password'
  )
  it 'should return the name' do
    expect(cat1.name).to eq 'mumu'
  end

  it 'should return the description' do
    expect(cat1.description).to eq 'lost cat'
  end

  it 'should return the mobile' do
    expect(cat1.mobile).to eq '01234555234'
  end
end
