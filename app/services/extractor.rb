require 'csv'

class Extractor
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def read
    CSV.foreach(file.tempfile, col_sep: ';', liberal_parsing: true) do |row|
      Builder::Expense.new(row).save
    end
  end
end