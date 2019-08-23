require 'minitest/autorun'
require "minitest/spec"
require_relative '../app/robot_factory'

describe RobotFactory do
  let(:name_generator) { MiniTest::Mock.new }
  let(:robot_factory) { RobotFactory.new(name_generator) }

  before do
    name_generator.expect :generate_name, "BD890"
    name_generator.expect :nil?, false
  end

  describe '#initialize' do
    it 'assets @robot_names as an empty array' do
      assert_equal robot_factory.robot_names, []
    end

    it 'assets @name_generator variable' do
      assert !robot_factory.name_generator.nil?
    end
  end

  describe '#create_robot' do
    it 'creates and returns a robot' do
      assert_kind_of Robot, robot_factory.create_robot
    end
  end

  describe '#new_robot_unique_name' do
    it 'returns a unique name' do
      robot_factory.robot_names = ['RX500', 'SZ224']
      assert !robot_factory.robot_names.take(robot_factory.robot_names.length - 1).include?(robot_factory.send(:new_robot_unique_name))
    end

    it 'calls NameGenerator.generate_name method' do
      assert_send [robot_factory.name_generator, :generate_name]
    end

    it 'puts a new name to the @robot_names array' do
      name = robot_factory.new_robot_unique_name
      assert robot_factory.robot_names.include?(name)
    end
  end
end
