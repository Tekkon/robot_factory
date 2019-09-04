module RobotFactorySpecHelper
  def not_unique_value_error_test(&block)
    name_generator.expect :generate_name, 'BD890'
    name_generator.expect :generate_name, 'BD890'
    robot_factory.robot_names = ["BD890"]

    assert_raises NotUniqueValueError do
      yield
    end
  end
end
