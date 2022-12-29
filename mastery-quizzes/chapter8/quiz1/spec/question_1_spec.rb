require 'mastery_answer_code_quality'
require_relative "../questions/question_1"

describe "Hashes" do
  describe "TRANSLATIONS" do
    it "is a hash" do
      expect(TRANSLATIONS).to be_an_instance_of(Hash)
    end

    it "has three keys" do
      expect(TRANSLATIONS.keys.count).to eq 4
    end

    it "has three values" do
      expect(TRANSLATIONS.values.count).to eq 4
    end
  end

  describe "ANIMAL_SOUNDS" do
    it "is a hash" do
      expect(ANIMAL_SOUNDS).to be_an_instance_of(Hash)
    end

    it "has these keys" do
      expect(ANIMAL_SOUNDS.keys).to eq ["dog", "cat", "cow"]
    end

    it "has these values" do
      expect(ANIMAL_SOUNDS.values).to eq ["woof", "meow", "moo"]
    end
  end

  describe "PERSON" do
    it "is a hash" do
      expect(PERSON).to be_an_instance_of(Hash)
    end

    it "has these keys" do
      expect(PERSON.keys).to eq ["name", "age", "profession", "favourite_book"]
    end
  end
end
