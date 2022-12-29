require 'greet'

RSpec.describe 'greet method' do
  it 'it should return: Hello, James!' do
    result = greet('James')
    expect(result).to eq 'Hello, James!'
  end
end
