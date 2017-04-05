require "spec_helper"

class MyQuestion
  include Question
end

class HowManyCharactersAre
  include Question

  def answer
    subject.size
  end
end

describe "Questions should" do
  it "not have any answers when the answer wasn't implemented" do
    question = MyQuestion.in("this string")
    expect { question.answer }.to raise_error Question::AnswerUnknownApology
  end

  it "have an answer when implemented" do
    question = HowManyCharactersAre.in("This string")

    expect(question.answer).to be 11
  end
end
