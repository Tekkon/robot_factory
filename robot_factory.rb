require_relative 'name_generator'
require_relative 'robot'

class RobotFactory
  attr_accessor :robots

  include NameGenerator

  def initialize
    @robots = []
  end

  def create_robot
    robots << Robot.new(generate_unique_name)
    robots.last
  end

  private

  def generate_unique_name
    loop do
      name = generate_name
      return name if is_unique?(name)
    end
  end

  def is_unique?(name)
    !robots.map { |r| r.name }.include?(name)
  end
end
