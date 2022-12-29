require 'task_formatter'

RSpec.describe TaskFormatter do
  context 'When formatting a pending task' do
    it 'should return [ ] Walk the dog' do
      task_1 = double :Task, title: 'Walk the dog', complete?: false
      task_formatter = TaskFormatter.new(task_1)
      expect(task_formatter.format).to eq '- [ ] Walk the dog'
    end
  end
end
