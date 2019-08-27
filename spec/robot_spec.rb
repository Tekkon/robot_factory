require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot'

describe Robot do
  let(:robot) { Robot.new('RX500') }

  it 'assets the name' do
    assert_equal robot.name, 'RX500'
  end
end
