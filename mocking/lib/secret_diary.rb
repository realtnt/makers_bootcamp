# File: lib/secret_diary.rb
require 'diary.rb'
class SecretDiary
  def initialize(diary)
    fail 'Invalid object' unless diary.is_a?(Diary)
    @contents = diary.read
    @locked = true
  end

  def read
    fail 'Go away!' if @locked
    return @contents
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end