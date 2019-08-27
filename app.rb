require_relative 'app/robot_factory'

class App
  attr_accessor :robot_factory

  def initialize
    @robot_factory = RobotFactory.build
  end

  def self.run
    App.new.run
  end

  def run
    loop do
      print_message
      create_robot
      print_result
    end
  end

  def print_message
    puts ''
    puts "Press any key to create a robot."
    gets.chomp
  end

  def create_robot
    robot_factory.create_robot
  end

  def print_result
    puts "There are several robots with these robot_names: #{robot_factory.robot_names}"
  end
end
