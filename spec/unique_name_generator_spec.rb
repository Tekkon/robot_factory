require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/unique_name_generator'

describe UniqueNameGenerator do
  let(:unique_name_generator) { UniqueNameGenerator.new(%w(RX500 SZ255)) }

  it 'assets @names' do
    assert_equal unique_name_generator.names, %w(RX500 SZ255)
  end

  describe "#generate_name" do
    it "returns a name based on a specific pattern" do
      assert /[A-Z][A-Z]\d\d\d/ === unique_name_generator.generate_name
    end

    it 'returns a unique name' do
      assert !unique_name_generator.names.include?(unique_name_generator.generate_name)
    end
  end

  describe 'private methods' do
    describe '#is_unique?' do
      it "returns true if a name is not in the @names array" do
        assert_equal unique_name_generator.send(:is_unique?, 'SZ333'), true
      end

      it 'returns false if a name is in the @names array' do
        assert_equal unique_name_generator.send(:is_unique?, 'RX500'), false
      end
    end
  end
end
