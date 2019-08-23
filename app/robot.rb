class Robot
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def reset_settings
    self.name = nil
  end
end
