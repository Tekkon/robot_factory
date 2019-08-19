require 'minitest/autorun'
require "minitest/spec"
require_relative '../robot'

describe Robot do
  let(:robot) {  Robot.new('RX500') }

  it 'assets the name' do
    assert_equal robot.name, 'RX500'
  end

  describe '#forget' do
    it 'erases the name' do
      assert_equal robot.forget, nil
    end
  end
end
