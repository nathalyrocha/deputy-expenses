class Parser::Deputy
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def name
    line[0]
  end

  def cpf
    line[1]
  end

  def state
    line[5]
  end
end