require_relative 'name_generator'
require_relative 'robot'

class RobotFactory
  attr_accessor :robots

  include NameGenerator

  def create_robot

  end

  private

  def is_unique?(robot)

  end
end
