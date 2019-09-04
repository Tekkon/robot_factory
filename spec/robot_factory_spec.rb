require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot_factory'
require_relative '../app/not_unique_value_error'
require_relative 'robot_factory_spec_helper'

describe RobotFactory do
  include RobotFactorySpecHelper

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
      robot = robot_factory.create_robot
      assert robot_factory.robot_names.include?(robot.name)
    end

    it 'raises an exception if the name is not unique' do
      not_unique_value_error_test do
        robot_factory.create_robot
      end
    end
  end

  describe '#reset_robot' do
    it "resets the robot's name" do
      name_generator.expect :generate_name, 'XZ235'
      robot = robot_factory.create_robot
      robot_factory.reset_robot(robot)
      assert_equal robot.name, 'XZ235'
    end

    it 'raises an exception if the name is not unique' do
      not_unique_value_error_test do
        robot = robot_factory.create_robot
        robot_factory.reset_robot(robot)
      end
    end
  end
end
