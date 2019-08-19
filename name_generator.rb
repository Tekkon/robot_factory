require 'string_pattern'

module NameGenerator
  def generate_name
    /[A-Z][A-Z]\d\d\d/.generate
  end
end
