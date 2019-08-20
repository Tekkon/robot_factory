require 'string_pattern'

class UniqueNameGenerator
  attr_accessor :names

  def initialize(names)
    @names = names
  end

  def generate_name
    loop do
      name = /[A-Z][A-Z]\d\d\d/.generate
      return name if is_unique?(name)
    end
  end

  private

  def is_unique?(name)
    !names.include?(name)
  end
end
