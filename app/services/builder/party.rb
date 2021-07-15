class Builder::Party
  attr_reader :line, :parser

  def initialize(line, parser = Parser::Party)
    @line = line
    @parse = parser.new(line)
  end

  def call
    ::Party.find_or_create_by(name: parse.name)
  end
end