require_relative 'unique_name_generator'
require_relative 'robot'

class RobotFactory
  attr_accessor :names

  def initialize
    @names = []
  end

  def create_robot
    self.names << UniqueNameGenerator.new(names).generate_name
    Robot.new(names.last)
  end
end
