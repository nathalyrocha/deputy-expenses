class Builder::Deputy
  attr_reader :line, :parser, :party

  def initialize(line, party, parser = Parser::Deputy)
    @line = line
    @party = party
    @parser = parser.new(line)
  end

  def call
    ::Deputy.find_or_create_by(
      name: parser.name, 
      cpf: parser.cpf, 
      party: party,
      state: parser.state 
    )
  end
end