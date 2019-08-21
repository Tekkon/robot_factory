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
    it 'assets @names as an empty array' do
      assert_equal robot_factory.names, []
    end

    it 'assets @name_generator variable' do
      assert !robot_factory.name_generator.nil?
    end
  end

  describe '#create_robot' do
    it 'creates and returns a robot' do
      assert_kind_of Robot, robot_factory.create_robot
    end

    it 'calls NameGenerator.generate_name method' do
      assert_send [robot_factory.name_generator, :generate_name]
    end

    it 'puts a new name to the @names array' do
      robot = robot_factory.create_robot
      assert robot_factory.names.include?(robot.name)
    end
  end

  describe 'private methods' do
    describe '#generate_unique_name' do
      it 'returns a name which is not in the @names array' do
        assert !robot_factory.names.include?(robot_factory.send(:generate_unique_name))
      end
    end

    describe '#is_unique?' do
      before do
        robot_factory.names = ['RX500', 'PB200']
      end

      it "returns true if a name is not in the @names array" do
        assert_equal robot_factory.send(:is_unique?, 'SZ333'), true
      end

      it 'returns false if a name is in the @names array' do
        assert_equal robot_factory.send(:is_unique?, 'RX500'), false
      end
    end
  end
end
