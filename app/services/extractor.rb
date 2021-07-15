class Extractor
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def read
    CSV.foreach(file, col_sep: ';', quote_char: 'x\00') do |row|
      Builder::Expense.new(row).save
  end
end