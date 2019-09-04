require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/name_generator'

describe NameGenerator do
  let(:name_generator) { NameGenerator.new }

  describe "#generate_name" do
    it "returns a name based on a specific pattern" do
      assert /[A-Z][A-Z]\d\d\d/ === name_generator.generate_name
    end
  end
end
