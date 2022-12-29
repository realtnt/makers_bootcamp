require 'diary'

RSpec.describe Diary do
  context 'when passing valid contents' do
    it 'should return: contents' do
      diary = Diary.new('contents')
      expect(diary.read).to eq 'contents'
    end
  end
  context 'when passing invalid contents' do
    it 'should raise an error: Invalid contents' do
      expect{Diary.new(nil)}.to raise_error 'Invalid contents'
    end
  end
end
