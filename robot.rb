class Robot
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.forget
    self.name = nil
  end
end

