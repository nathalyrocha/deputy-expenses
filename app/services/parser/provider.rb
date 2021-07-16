class Parser::Provider
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def name
    line[12]
  end
end