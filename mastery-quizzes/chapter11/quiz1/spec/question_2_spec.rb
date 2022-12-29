require "mastery_answer_code_quality"
require_relative "../questions/question_2"

describe LittleAdventure do
  context "move north to cave, move north to win" do
    let(:expected_output) {
      ["You are in a scary cave.",
       "You walk into sunlight."]
        .join("\n.*")
    }

    it "`puts`es cave description, win description" do
      allow(subject).to receive(:gets).and_return("north\n", "north\n")
      expect{ subject.play }.to output{ expected_output }.to_stdout
    end
  end

  context "incorrect command in passage, move north to cave, move north" do
    let(:expected_output) { ["You are in a scary cave.\n",
                             "You walk into sunlight.\n"] }

    it "no error, `puts`es cave description, win description" do
      allow(subject).to receive(:gets).and_return("blah\n", "north\n", "north\n")
      expect{ subject.play }.to output{ expected_output }.to_stdout
    end
  end

  context "move north and south several times, then north twice" do
    let(:expected_output) {
      ["You are in a scary cave.",
       "You are in a scary passage.",

       "You are in a scary cave.",
       "You are in a scary passage.",

       "You are in a scary cave.",
       "You are in a scary passage.",

       "You are in a scary cave.",
       "You walk into sunlight."]
        .join("\n.*")
    }

    it "`puts`es descriptions of both rooms several times, win description" do
      allow(subject).to receive(:gets).and_return(
        "north\n", "south\n",
        "north\n", "south\n",
        "north\n", "south\n",
        "north\n", "north\n",
      )
      expect{ subject.play }.to output{ expected_output }.to_stdout
    end
  end

  context "move north to cave, incorrect command in cave, move north" do
    let(:expected_output) { ["You are in a scary cave.\n",
                             "You walk into sunlight.\n"] }

    it "`puts`es cave description, no error, `puts`es win description" do
      allow(subject).to receive(:gets).and_return("north\n", "blah\n", "north\n")
      expect{ subject.play }.to output{ expected_output }.to_stdout
    end
  end

  # it "has acceptable code quality" do
  #   code_quality = MasteryAnswerCodeQuality.build(__FILE__)
  #   expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  # end
end
