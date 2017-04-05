require 'spec_helper'

describe "Actors should" do

  let(:peter) { Actor.named("Peter") }

  it "have a name" do
    expect(peter).to be_named("Peter")
  end

  it "learn new abilities" do
    peter.learn_to(SayHello)

    expect(peter).to have_learned_to(:say_hello)
  end

  it "remember things" do
    peter.remember("Buy the milk!")

    expect(peter).to recall("Buy the milk!")
  end

  it "remember anything" do
    kelly = Actor.named("Kelly")
    peter.remember kelly
    
    expect(peter).to recall(kelly)
  end

  it "attempt to perform a task" do
    perform = double("some task")

    expect(perform).to receive(:as).with(peter)

    peter.attempt_to perform
  end

  it "attempt to perform many tasks" do
    perform_first = double "first task"
    perform_second = double "second task"

    expect(perform_first).to receive(:as).with(peter)
    expect(perform_second).to receive(:as).with(peter)

    peter.attempt_to(perform_first, perform_second)
  end
end

module SayHello
  def say_hello
    "Oh, hai!"
  end
end
