require_relative "../questions/question_1"
require "mastery_answer_code_quality"

describe 'Q1. FizzBuzz class' do
  subject { FizzBuzz.new }
  describe FizzBuzz do
    describe '#play_until' do
      it 'returns the correct sequence' do
        expect(subject.play_until(15)).to eq [
          "1",
          "2",
          "Fizz",
          "4",
          "Buzz",
          "Fizz",
          "7",
          "8",
          "Fizz",
          "Buzz",
          "11",
          "Fizz",
          "13",
          "14",
          "FizzBuzz",
        ]
      end
    end
  end

  describe '#is_divisible_by_three' do
    it 'returns true for 3' do
      expect(subject.divisible_by_three(3)).to eq true
    end
    it 'returns false for 4' do
      expect(subject.divisible_by_three(4)).to eq false
    end
  end

  describe '#is_divisible_by_five' do
    it 'returns true for 5' do
      expect(subject.divisible_by_five(5)).to eq true
    end
    it 'returns false for 6' do
      expect(subject.divisible_by_five(6)).to eq false
    end
  end

  describe '#is_divisible_by_fifteen' do
    it 'returns true for 15' do
      expect(subject.divisible_by_three(15)).to eq true
    end
    it 'returns false for 16' do
      expect(subject.divisible_by_three(16)).to eq false
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
