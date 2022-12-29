require_relative "../questions/question_2"
require "mastery_answer_code_quality"

describe "Q2. Calculator" do

  describe 'add' do
    it 'adds 1 and 1, to return 2' do
      expect(add(1,1)).to eq 2
    end

    it 'adds 2 and 3, to return 5' do
      expect(add(2,3)).to eq 5
    end
  end

  describe 'subtract' do
    it 'performs 2 minus 1, to return 1' do
      expect(subtract(2,1)).to eq 1
    end

    it 'performs 100 minus 10, to return 90' do
      expect(subtract(100,10)).to eq 90
    end
  end

  describe 'multiply' do
    it 'multiplies 10 by 10, to return 100' do
      expect(multiply(10, 10)).to eq 100
    end

    it 'multiplies 1 by 1, to return 1' do
      expect(multiply(1, 1)).to eq 1
    end
  end

  describe 'divide' do
    it 'divides 10 by 5, to return 2' do
      expect(divide(10, 5)).to eq 2
    end

    it 'divides 10 by 2, to return 5' do
      expect(divide(10, 2)).to eq 5
    end
  end

  describe 'square' do
    it 'squares 2, to return 4' do
      expect(square(2)).to eq 4
    end

    it 'squares 5, to return 25' do
      expect(square(5)).to eq 25
    end

    it 'uses multiply' do
      expect(self).to receive(:multiply).with(2, 2)
      square(2)
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
