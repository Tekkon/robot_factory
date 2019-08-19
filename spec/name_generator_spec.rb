require 'minitest/autorun'
require "minitest/spec"
require_relative '../name_generator'

include NameGenerator

describe NameGenerator do
  describe "#generate_name" do
    it "returns a name based on a specific pattern" do
      assert /[A-Z][A-Z]\d\d\d/ === generate_name
    end
  end
end
