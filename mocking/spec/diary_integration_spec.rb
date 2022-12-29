require 'secret_diary'
require 'diary'

RSpec.describe 'Diary Integration: ' do
  diary = Diary.new('contents')
  secret_diary = SecretDiary.new(diary)
  
  context 'when trying to read a locked diary entry' do
    it 'should return: Go away' do      
      expect {secret_diary.read}.to raise_error 'Go away!'
    end
  end
  context 'when trying to read an unlocked diary entry' do
    it 'should return: contents' do
      secret_diary.unlock
      expect(secret_diary.read).to eq('contents')
    end
  end
  context 'when locking an unlocked diary entry and trying it' do
    it 'should return: Go away' do
      secret_diary.unlock
      secret_diary.lock
      expect {secret_diary.read}.to raise_error 'Go away!'
    end
  end
  context 'passing anything other than a Diary object' do
    it 'should raise an error: Invalid object' do
      expect {SecretDiary.new(nil)}.to raise_error 'Invalid object'
    end
  end
end