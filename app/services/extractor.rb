require 'csv'

class Extractor
  attr_reader :document

  def initialize(document)
    @document = document
  end

  def read
    document.blob.open do |tempfile|
      CSV.foreach(tempfile, col_sep: ';', liberal_parsing: true) do |row|
        Builder::Expense.new(
          row.map { _1.gsub('"', '') }
        ).save
      end
    end
  end
end