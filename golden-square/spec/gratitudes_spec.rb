require 'gratitudes'

RSpec.describe Gratitudes do
  grat = Gratitudes.new

  it 'should return: Be grateful for: ' do
    result = grat.format
    expect(result).to eq('Be grateful for: ')
  end

  it 'should return: Be grateful for: the Bucks' do
    grat.add('the Bucks')
    result = grat.format
    expect(result).to eq('Be grateful for: the Bucks')
  end

  it 'should return: Be grateful for: the Bucks, sliced bread' do
    grat.add('sliced bread')
    result = grat.format
    expect(result).to eq('Be grateful for: the Bucks, sliced bread')
  end
end
