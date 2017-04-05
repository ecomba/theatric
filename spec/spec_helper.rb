$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

RSpec::Matchers.define :recall do |memory|
  match do |actor|
    actor.recall.eql? memory
  end
end

include CustomMatchers

require "theatric"
