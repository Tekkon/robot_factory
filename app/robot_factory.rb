require_relative 'name_generator'
require_relative 'robot'

class RobotFactory
  attr_accessor :names, :name_generator

  def initialize(name_generator)
    @names = []
    @name_generator = name_generator
  end

  def create_robot
    Robot.new
  end

  def new_robot_name
    name = nil

    loop do
      name = name_generator.generate_name
      break unless names.include?(name)
    end

    names << name
    name
  end
end
