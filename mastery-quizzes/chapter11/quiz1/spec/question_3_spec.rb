require "mastery_answer_code_quality"
require_relative '../questions/question_3'

describe ScrabbleSolver do
  describe "#score" do
    context "word with three blanks" do
      it "returns the score for non-blank letter (1)" do
        expect(subject.score(" A  ")).to eq 1
      end
    end
  end

  context "word with all the letters in the alphabet" do
    let (:word) { ("A".."Z").to_a.join("") }

    it "returns score for word (87)" do
      expect(subject.score(word)).to eq 87
    end
  end

  context "word with repeated letters" do
    it "returns score for all letters (6)" do
      expect(subject.score("GOOD")).to eq 6
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
