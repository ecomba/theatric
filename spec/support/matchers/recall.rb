module CustomMatchers
  class Recall
    def initialize(memory)
      @memory = memory
    end

    def matches?(actor)
      @actor = actor
      @actor.name.eql? @memory
    end

    def failure_message
      "Expected #{@actor.name} (the actor) to remember #{@memory}"
    end

    def failure_message_when_negated
      "Expected #{@actor.name} (the actor) not to remember #{@memory}"
    end
  end

  def recall(memory)
    Recall.new(memory)
  end
end
