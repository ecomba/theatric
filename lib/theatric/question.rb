module Question
  class AnswerUnknownApology < Exception
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send :prepend, Initializer
  end

  module ClassMethods
    def in(subject)
      new(subject)
    end
  end

  module Initializer
    private
    def initialize(subject)
      @subject = subject
    end
  end

  def answer
    raise AnswerUnknownApology.new "I'm really sorry, but I don't have any answer for you."
  end

  private
  def subject
    @subject
  end
end
