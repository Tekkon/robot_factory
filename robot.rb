class Robot
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def forget
    self.name = nil
  end
end
