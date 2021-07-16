require 'csv'

class Extractor
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def read
    CSV.foreach(file.tempfile, col_sep: ';', liberal_parsing: true) do |row|
      Builder::Expense.new(
        row.map { _1.gsub('"', '') }
      ).save
    end
  end
end