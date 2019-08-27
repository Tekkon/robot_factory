require_relative 'name_generator'
require_relative 'robot'

class RobotFactory
  attr_accessor :robot_names, :name_generator

  def self.build
    new(NameGenerator.new)
  end

  def initialize(name_generator)
    @robot_names = []
    @name_generator = name_generator
  end

  def create_robot
    Robot.new(new_unique_robot_name)
  end

  def reset_robot(robot)
    robot.name = new_unique_robot_name
  end

  private

  def new_unique_robot_name
    begin new_name = name_generator.generate_name end while robot_names.include?(new_name)
    new_name.tap { |name| robot_names << name }
  end
end
