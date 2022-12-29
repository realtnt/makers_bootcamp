require 'counter'

RSpec.describe Counter do
  it 'should report a count of 10' do
    count = Counter.new
    count.add(1)
    result = count.report
    expect(result).to eq('Counted to 1 so far.')
    count.add(9)
    result = count.report
    expect(result).to eq('Counted to 10 so far.')
  end

  it 'should report a count of 0' do
    count = Counter.new
    result = count.report
    expect(result).to eq('Counted to 0 so far.')
  end

  100.times do
    a = rand(100)
    b = rand(200)
    it "should repost a count of #{a + b}" do
      count = Counter.new
      count.add(a)
      count.add(b)
      result = count.report
      expect(result).to eq("Counted to #{a + b} so far.")
    end
  end
end
