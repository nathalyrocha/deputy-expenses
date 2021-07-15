class Builder::Provider
  attr_reader :line, :parser

  def initialize(line, parser = Parser::Provider)
    @line = line
    @parser = parser.new(line)
  end

  def call
    ::Provider.find_or_create_by(name: parser.name)
  end
end