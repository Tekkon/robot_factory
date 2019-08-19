require 'minitest/autorun'
require "minitest/spec"
require_relative '../robot_factory'

describe RobotFactory do
  let(:robot_factory) { RobotFactory.new }

  it 'assets robots as an empty array' do
    assert_equal robot_factory.robots, []
  end

  describe '#create_robot' do
    it 'creates and returns a robot' do
      assert_kind_of Robot, robot_factory.create_robot
    end

    it "assets the robot's name" do
      refute_empty robot_factory.create_robot.name
    end

    it 'calls generate_unique_name method' do
      assert_send [robot_factory, :generate_unique_name]
    end

    it 'puts a new robot to @robots array' do
      robot_factory.create_robot
      refute_empty robot_factory.robots
    end
  end

  describe 'private methods' do
    before do
      robot_factory.robots = [Robot.new('RX500'), Robot.new('SB250'), Robot.new('ZS777')]
    end

    describe '#generate_unique_name' do
      it 'returns a name which is not used yet' do
        assert !robot_factory.robots.map{ |r| r.name }.include?(robot_factory.send(:generate_unique_name))
      end
    end

    describe '#is_unique?' do
      it "returns true if robots don't have the name" do
        assert_equal robot_factory.send(:is_unique?, 'SZ333'), true
      end

      it 'returns false if robots have the name' do
        assert_equal robot_factory.send(:is_unique?, 'RX500'), false
      end
    end
  end
end
