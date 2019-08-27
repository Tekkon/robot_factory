require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot_factory'

describe RobotFactory do
  let(:name_generator) { MiniTest::Mock.new }
  let(:robot_factory) { RobotFactory.new(name_generator) }

  before do
    name_generator.expect :generate_name, 'BD890'
    name_generator.expect :generate_name, 'KX320'
    name_generator.expect :nil?, false
  end

  describe '#create_robot' do
    it 'creates a robot with a name' do
      assert !robot_factory.create_robot.name.nil?
    end
  end

  describe '#reset_robot' do
    it "resets the robot's name" do
      robot = robot_factory.create_robot
      assert robot.name != robot_factory.reset_robot(robot)
    end
  end

  describe '#new_unique_robot_name' do
    it 'returns a unique name' do
      assert robot_factory.send(:new_unique_robot_name) != robot_factory.send(:new_unique_robot_name)
    end

    it 'puts a new name to the @robot_names array' do
      name = robot_factory.send(:new_unique_robot_name)
      assert robot_factory.robot_names.include?(name)
    end
  end
end
