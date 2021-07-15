class Parser::Party
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def name
    line[6]
  end
end