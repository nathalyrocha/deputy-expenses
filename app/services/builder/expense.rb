class Builder::Expense
  attr_reader :line, :parser

  def initialize(line, parser = Parser::Expense)
    @line = line
    @parser = parser.new(line)
  end

  def save
    return unless valid?

    expense
  end

  private

  def valid?
    rj? && cpf?
  end

  def rj?
    line[5] == "RJ"
  end

  def cpf?
    line[1].present?
  end

  def party
    @party ||= Builder::Party.new(line).call
  end

  def provider
    @provider ||= Builder::Provider.new(line).call
  end

  def deputy
    @deputy ||= Builder::Deputy.new(line, party).call
  end

  def expense
    ::Expense.find_or_create_by(
      net_value: parser.net_value, 
      emission_date: parser.emission_date, 
      description: parser.description, 
      provider: provider, 
      deputy: deputy
    )
  end
end