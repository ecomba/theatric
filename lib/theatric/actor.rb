class Actor
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.named(name)
    Actor.new(name)
  end

  def learn_to(ability)
    extend ability
  end

  def has_learned_to?(ability)
    self.respond_to? ability
  end

  def remember(memory)
    @memory = memory
  end

  def recall
    @memory
  end

  def attempt_to *perform
    perform.each {|perform_task| perform_task.as(self) }
  end

end
