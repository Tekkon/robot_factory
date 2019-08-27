require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot_factory'
require_relative '../app/not_unique_value_error'

describe RobotFactory do
  let(:name_generator) { MiniTest::Mock.new }
  let(:robot_factory) { RobotFactory.new(name_generator) }

  before do
    name_generator.expect :generate_name, 'BD890'
    name_generator.expect :nil?, false
  end

  describe '#create_robot' do
    it 'creates a robot with a name' do
      assert_equal robot_factory.create_robot.name, 'BD890'
    end

    it 'puts a new name to the @robot_names array' do
      robot_factory.robot_names = []
      robot = robot_factory.create_robot
      assert robot_factory.robot_names.include?(robot.name)
    end

    it 'raises an exception if the name is not unique' do
      name_generator.expect :generate_name, 'BD890'
      name_generator.expect :generate_name, 'BD890'
      robot_factory.robot_names = ["BD890"]

      assert_raises NotUniqueValueError do
        robot_factory.create_robot
      end
    end
  end

  describe '#reset_robot' do
    before do
      name_generator.expect :generate_name, 'XZ235'
    end

    it "resets the robot's name" do
      robot = robot_factory.create_robot
      robot_factory.reset_robot(robot)
      assert_equal robot.name, 'XZ235'
    end
  end
end
