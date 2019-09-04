require_relative 'name_generator'
require_relative 'robot'
require_relative 'not_unique_value_error'

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
    robot.tap { |r| r.name = new_unique_robot_name }
  end

  private

  def new_unique_robot_name
    cycles_count = 0

    begin
      new_name = name_generator.generate_name
      cycles_count +=1
      raise NotUniqueValueError.new("The name shoud be unique!") if cycles_count >= 3
    end while robot_names.include?(new_name)

    new_name.tap { |name| robot_names << name }
  end
end
