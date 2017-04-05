module CustomMatchers
  class BeNamed
    def initialize(expected_name)
      @expected_name = expected_name
    end

    def matches?(actor)
      @actor = actor
      @actor.name.eql? @expected_name
    end

    def failure_message
      "Expected #{@actor.name} (the actor) to be named #{@expected_name}"
    end

    def failure_message_when_negated
      "Expected #{@actor.name} (the actor) not to be named #{@expected_name}"
    end
  end

  def be_named(expected_name)
    BeNamed.new(expected_name)
  end
end
