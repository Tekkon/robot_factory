require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot_factory'

describe RobotFactory do
  let(:robot_factory) { RobotFactory.new }

  it 'assets names as an empty array' do
    assert_equal robot_factory.names, []
  end

  describe '#create_robot' do
    it 'creates and returns a robot' do
      assert_kind_of Robot, robot_factory.create_robot
    end

    it 'calls UniqueNameGenerator.generate_name method' do
      assert_send [UniqueNameGenerator.new(robot_factory.names), :generate_name]
    end

    it 'puts a new name to the @names array' do
      robot = robot_factory.create_robot
      assert robot_factory.names.include?(robot.name)
    end
  end
end
