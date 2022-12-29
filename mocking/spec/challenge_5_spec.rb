require 'challenge_5'

RSpec.describe StringRepeater do
  it 'should return the correct result' do
    io = double :io
    expect(io).to receive(:puts).with('Hello. I will repeat a string many times.')
    expect(io).to receive(:puts).with('Please enter a string')
    expect(io).to receive(:gets).and_return('TWIX')
    expect(io).to receive(:puts).with('Please enter a number of repeats')
    expect(io).to receive(:gets).and_return('10')
    expect(io).to receive(:puts).with('Here is your result:')
    expect(io).to receive(:puts).with('TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX')

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end
end