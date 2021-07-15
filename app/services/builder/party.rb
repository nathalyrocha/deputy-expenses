class Builder::Party
  attr_reader :line, :parser

  def initialize(line, parser = Parser::Party)
    @line = line
    @parser = parser.new(line)
  end

  def call
    ::Party.find_or_create_by(name: parser.name)
  end
end