require 'exercise_5'

RSpec.describe InteractiveCalculator do
  it 'should return the correct result' do
    io = double :io
    expect(io).to receive(:puts).with('Hello. I will subtract two numbers.')
    expect(io).to receive(:puts).with('Please enter a number ')
    expect(io).to receive(:gets).and_return('4')
    expect(io).to receive(:puts).with('Please enter another number ')
    expect(io).to receive(:gets).and_return('3')
    expect(io).to receive(:puts).with('4 - 3 = 1')

    interactive_calc = InteractiveCalculator.new(io)
    interactive_calc.run
  end
end