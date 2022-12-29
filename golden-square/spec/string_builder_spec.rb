require 'string_builder'
str_1 = StringBuilder.new
RSpec.describe StringBuilder do
  it 'should report a count of 0 when no strings have been added.' do
    result = str_1.size
    expect(result).to eq(0)
  end

  it 'should return an empty string when no strings have been added.' do
    result = str_1.output
    expect(result).to eq('')
  end

  it 'should return a count of 8' do
    str_1.add('a_string')
    result = str_1.size
    expect(result).to eq(8)
  end

  it 'should return: a_string' do
    result = str_1.output
    expect(result).to eq('a_string')
  end
end
