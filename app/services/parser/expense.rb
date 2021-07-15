class Parser::Expense
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def net_value
    line[19]
  end

  def emission_date
    DateTime.parse(line[16])
  end

  def description
    line[9]
  end
end