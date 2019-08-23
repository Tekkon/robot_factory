require_relative 'app/robot_factory'

class App
  attr_accessor :robot_factory, :robot

  def initialize
    @robot_factory = RobotFactory.new(NameGenerator.new)
  end

  def self.run
    App.new.run
  end

  def run
    loop do
      print_message
      create_robot
      asset_new_robot_name
      print_result
    end
  end

  def print_message
    puts ''
    puts "Press any key to create a robot."
    gets.chomp
  end

  def create_robot
    self.robot = robot_factory.create_robot
  end

  def asset_new_robot_name
    robot.name = robot_factory.new_robot_name
  end

  def print_result
    puts "There are several robots with these names: #{robot_factory.names}"
  end
end
