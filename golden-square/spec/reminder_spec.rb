require 'reminder'

RSpec.describe Reminder do
  it 'reminds the user to do a task' do
    reminder = Reminder.new('Theo')
    reminder.remind_me_to('Take a break')
    result = reminder.remind
    expect(result).to eq 'Take a break, Theo!'
  end
end
