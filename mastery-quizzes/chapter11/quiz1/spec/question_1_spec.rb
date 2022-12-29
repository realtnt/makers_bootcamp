require_relative "../questions/question_1"
#require "mastery_answer_code_quality"

describe Deck do
  describe "#draw_card" do
    it "returns all the cards in a suit" do
      expect(subject).to receive(:rand).with(52).and_return(0)
      expect(subject.draw_card).to eq("two")

      expect(subject).to receive(:rand).with(51).and_return(0)
      expect(subject.draw_card).to eq("three")

      expect(subject).to receive(:rand).with(50).and_return(0)
      expect(subject.draw_card).to eq("four")

      expect(subject).to receive(:rand).with(49).and_return(0)
      expect(subject.draw_card).to eq("five")

      expect(subject).to receive(:rand).with(48).and_return(0)
      expect(subject.draw_card).to eq("six")

      expect(subject).to receive(:rand).with(47).and_return(0)
      expect(subject.draw_card).to eq("seven")

      expect(subject).to receive(:rand).with(46).and_return(0)
      expect(subject.draw_card).to eq("eight")

      expect(subject).to receive(:rand).with(45).and_return(0)
      expect(subject.draw_card).to eq("nine")

      expect(subject).to receive(:rand).with(44).and_return(0)
      expect(subject.draw_card).to eq("ten")

      expect(subject).to receive(:rand).with(43).and_return(0)
      expect(subject.draw_card).to eq("jack")

      expect(subject).to receive(:rand).with(42).and_return(0)
      expect(subject.draw_card).to eq("queen")

      expect(subject).to receive(:rand).with(41).and_return(0)
      expect(subject.draw_card).to eq("king")

      expect(subject).to receive(:rand).with(40).and_return(0)
      expect(subject.draw_card).to eq("ace")
    end

    it "removes the drawn card from the deck" do 
      expect { subject.draw_card }.to change { subject.cards.count }.by(-1)
    end
  end
end

describe Blackjack do
  describe "#move" do
    context "user inputs hit" do
      let (:user_input) { "hit\n" }

      it 'returns `"hit"`' do
        allow(subject).to receive(:gets).and_return(user_input)
        expect(subject.move).to eq("hit")
      end
    end

    context "user inputs stick" do
      let (:user_input) { "stick\n" }

      it 'returns `"stick"`' do
        allow(subject).to receive(:gets).and_return(user_input)
        expect(subject.move).to eq("stick")
      end
    end

    context "user inputs blah and then a valid move" do
      let (:user_input) { ["blah\n", "hit\n"] }

      it 'returns valid move (`"hit"`)' do
        allow(subject).to receive(:gets).and_return(*user_input)
        expect(subject.move).to eq("hit")
      end
    end
  end

  describe "#score" do
    describe "individual cards" do
      it 'scores `"two"` as 2' do
        expect(subject.score(["two"])).to eq(2)
      end

      it 'scores `"three"` as 3' do
        expect(subject.score(["three"])).to eq(3)
      end

      it 'scores `"four"` as 4' do
        expect(subject.score(["four"])).to eq(4)
      end

      it 'scores `"five"` as 5' do
        expect(subject.score(["five"])).to eq(5)
      end

      it 'scores `"six"` as 6' do
        expect(subject.score(["six"])).to eq(6)
      end

      it 'scores `"seven"` as 7' do
        expect(subject.score(["seven"])).to eq(7)
      end

      it 'scores `"eight"` as 8' do
        expect(subject.score(["eight"])).to eq(8)
      end

      it 'scores `"nine"` as 9' do
        expect(subject.score(["nine"])).to eq(9)
      end

      it 'scores `"ten"` as 10' do
        expect(subject.score(["ten"])).to eq(10)
      end

      it 'scores `"jack"` as 10' do
        expect(subject.score(["jack"])).to eq(10)
      end

      it 'scores `"queen"` as 10' do
        expect(subject.score(["queen"])).to eq(10)
      end

      it 'scores `"king"` as 10' do
        expect(subject.score(["king"])).to eq(10)
      end

      it 'scores `"ace"` as 11' do
        expect(subject.score(["ace"])).to eq(11)
      end
    end

    describe "adding up card scores" do
      it 'scores `"two"`, `"jack"` and `"ace"` as 23' do
        expect(subject.score(["two", "jack", "ace"])).to eq(23)
      end
    end
  end

  describe "#run_game" do
    describe "showing score so far as game is played" do
      let (:user_input) { ["hit\n",
                           "hit\n",
                           "stick\n"] }

      let (:expected_output) { ["Score so far: 10",
                                "Score so far: 17"].join("\n.*") }

      it "`puts`es scores for two hits" do
        srand(1)
        set_user_input_and_check_expected_output
      end
    end

    describe "`puts`ing outcome of game" do
      context "player takes too many cards and busts" do
        let (:user_input) { ["hit\n",
                             "hit\n",
                             "hit\n",
                             "stick\n"] }

        let (:expected_output) { "You busted with: 28\n" }

        it "`puts`es You busted with: 28" do
          srand(1)
          set_user_input_and_check_expected_output
        end
      end

      context "player doesn't take too many cards" do
        let (:user_input) { ["hit\n",
                             "hit\n",
                             "stick\n"] }

        let (:expected_output) { "You scored: 17\n" }

        it "`puts`es You scored: 17" do
          srand(1)
          set_user_input_and_check_expected_output
        end
      end
    end

    def set_user_input_and_check_expected_output
      allow_any_instance_of(Object)
        .to receive(:gets).and_return(*user_input)

      expect { subject.run_game }
        .to output(/#{expected_output}/m).to_stdout
    end
  end

  # it "has acceptable code quality" do
  #   code_quality = MasteryAnswerCodeQuality.build(__FILE__)
  #   expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  # end
end