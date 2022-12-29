# File: lib/diary.rb

class Diary
  def initialize(contents)
    fail 'Invalid contents' unless contents.is_a?(String)
    @contents = contents
  end

  def read
    return @contents
  end
end