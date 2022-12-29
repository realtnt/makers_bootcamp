require 'check_codeword'

RSpec.describe 'check_codeword method' do
  it 'should return: Correct! Come in. ' do
    result = check_codeword('horse')
    expect(result).to eq('Correct! Come in.')
  end

  it 'should return: WRONG!' do
    result = check_codeword('donkey')
    expect(result).to eq('WRONG!')
  end

  it 'should return: Close, but nope.' do
    result = check_codeword('hare')
    expect(result).to eq('Close, but nope.')
  end
end
