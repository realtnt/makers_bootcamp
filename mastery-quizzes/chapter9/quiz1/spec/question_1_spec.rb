require 'timecop'
require_relative "../questions/question_1"
require "mastery_answer_code_quality"

describe "Q1. Greetings" do

  describe 'goodbye' do
    it 'always returns "See you soon!"' do
      expect(goodbye).to eq 'See you soon!'
    end
  end

  describe '#hello' do
    context 'between 09:00 and 12:00' do
      before do
        new_time = Time.local(1906, 12, 9, 9, 0, 0)
        Timecop.freeze(new_time)
      end

      it "returns 'Good morning!'" do
        expect(hello).to eq 'Good morning!'
      end
    end

    context 'between 12:00 and 16:00' do
      before do
        new_time = Time.local(1906, 12, 9, 15, 0, 0)
        Timecop.freeze(new_time)
      end

      it "returns 'Good afternoon!'" do
        expect(hello).to eq 'Good afternoon!'
      end
    end

    context 'at all other times' do
      before do
        new_time = Time.local(1906, 12, 9, 18, 0, 0)
        Timecop.freeze(new_time)
      end

      it "returns 'Hello!'" do
        expect(hello).to eq 'Hello!'
      end
    end
  end

  # test that a method called how are you returns "How are you?"
  describe '#how_are_you' do
    it 'returns "How are you?"' do
      expect(how_are_you).to eq 'How are you?'
    end
  end

  # test that a method called fun returns "learning Ruby is"
  describe '#fun' do
    it 'returns "learning Ruby is"' do
      expect(fun).to eq 'learning Ruby is'
    end
  end

  # test that a method called hashes returns "are a collection of key-value pairs"
  describe '#hashes' do
    it 'returns "are a collection of key-value pairs"' do
      expect(hashes).to eq 'are a collection of key-value pairs'
    end
  end

  # test that a method called arrays returns "are a bit like lists"
  describe '#arrays' do
    it 'returns "are a bit like lists"' do
      expect(arrays).to eq 'are a bit like lists'
    end
  end

  # test that a method called control_flow returns "determines the order of execution"
  describe '#control_flow' do
    it 'returns "determines the order of execution"' do
      expect(control_flow).to eq 'determines the order of execution'
    end
  end

  # it "has acceptable code quality" do
  #   code_quality = MasteryAnswerCodeQuality.build(__FILE__)
  #   expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  # end
end