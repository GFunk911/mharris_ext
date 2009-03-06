class Regexp
  def self.escaped(str)
    new(escape(str))
  end
end