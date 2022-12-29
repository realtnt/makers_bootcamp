require_relative '../questions/question_3'
require 'mastery_answer_code_quality'

describe "Q3. ToDo list" do
  describe 'print_todos' do

    let(:todos) {["Buy milk", "Clean house", "Relax"]}

    it "prints the todos, one on each line" do
      expect{ print_todos(todos) }.to output(
        "Buy milk\nClean house\nRelax\n"
      ).to_stdout
    end
  end

  describe "add_todo" do

    let(:todos) { [] }

    it "adds a todo to the list" do
      add_todo(todos, "Buy milk")
      expect(todos).to eq ["Buy milk"]
    end
  end

  describe "remove_todo" do

    let(:todos) {["Buy milk", "Clean house", "Relax"]}

    it "removes a todo from the list" do
      remove_todo(todos, "Buy milk")
      expect(todos).to eq ["Clean house", "Relax"]
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end