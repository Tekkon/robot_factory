require_relative 'name_generator'
require_relative 'robot'

class RobotFactory
  attr_accessor :names, :name_generator

  def self.build
    new(NameGenerator.new)
  end

  def initialize(name_generator)
    @names = []
    @name_generator = name_generator
  end

  def create_robot
    self.names << generate_unique_name
    Robot.new(names.last)
  end

  private

  def generate_unique_name
    loop do
      name = name_generator.generate_name
      return name if is_unique?(name)
    end
  end

  def is_unique?(name)
    !names.include?(name)
  end
end
