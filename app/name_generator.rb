require 'string_pattern'

class NameGenerator
  def generate_name
    /[A-Z][A-Z]\d\d\d/.generate
  end
end
