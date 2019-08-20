require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot'

describe Robot do
  let(:robot) { Robot.new('RX500') }

  it 'assets the name' do
    assert_equal robot.name, 'RX500'
  end

  describe '#reset_settings' do
    it 'erases all the variables' do
      robot.reset_settings
      assert_equal robot.name, nil
    end
  end
end
