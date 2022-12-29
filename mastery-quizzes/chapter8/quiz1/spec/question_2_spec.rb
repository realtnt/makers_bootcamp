require "mastery_answer_code_quality"


describe "Q2. Translator" do
  context "when given `a good developer solves problems in small steps`" do
    let (:user_input) { "a good developer solves problems in small steps" }
    let (:expected_output) { "un buen desarrollador resuelve problemas en pequeños pasos" }

    it "puts'es `un buen desarrollador resuelve problemas en pequeños pasos`" do
      set_user_input_and_check_expected_output
    end
  end

  context "when given `a good developer executes code frequently`" do
    let (:user_input) { "a good developer executes code frequently" }
    let (:expected_output) { "un buen desarrollador ejecuta su código con frecuencia" }

    it "puts'es `un buen desarrollador ejecuta su código con frecuencia`" do
      set_user_input_and_check_expected_output
    end
  end

  context "when given `a great developer is a team player`" do
    let (:user_input) { "a great developer is a team player" }
    let (:expected_output) { "un excelente desarrollador es un equipo jugador" }

    it "puts'es `un excelente desarrollador es un equipo jugador`" do
      set_user_input_and_check_expected_output
    end
  end

  context "when given `a great developer is a good listener`" do
    let (:user_input) { "a great developer is a good listener" }
    let (:expected_output) { "un excelente desarrollador es un buen oyente" }

    it "puts'es `un excelente desarrollador es un buen oyente`" do
      set_user_input_and_check_expected_output
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end

  def set_user_input_and_check_expected_output
    allow_any_instance_of(Object)
      .to receive(:gets).and_return(user_input)

    expect { load "questions/question_2.rb" }
      .to output(/#{expected_output}/).to_stdout
  end
end
