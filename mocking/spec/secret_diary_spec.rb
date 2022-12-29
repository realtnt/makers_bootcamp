require 'secret_diary'

RSpec.describe SecretDiary do
  context 'when trying to read a locked diary entry' do
    it 'should return: Go away' do
      diary = double :Diary, read: 'contents', is_a?: Diary
      secret_diary = SecretDiary.new(diary)
      expect {secret_diary.read}.to raise_error 'Go away!'
    end
  end
  context 'when trying to read an unlocked diary entry' do
    it 'should return: contents' do
      diary = double :Diary, read: 'contents', is_a?: Diary
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq('contents')
    end
  end
  context 'when locking an unlocked diary entry and trying it' do
    it 'should return: Go away' do
      diary = double :Diary, read: 'contents', is_a?: Diary
      secret_diary = SecretDiary.new(diary)
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