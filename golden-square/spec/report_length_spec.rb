require 'report_length'

RSpec.describe('report_length method') do
  it('should return: This string was 8 characters long.') do
    result = report_length('12345678')
    expect(result).to eq('This string was 8 characters long.')
  end

  it('should return This string was 2 characters long.') do
    result = report_length('ab')
    expect(result).to eq('This string was 2 characters long.')
  end
end
