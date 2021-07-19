class ImportExpensesJob < ApplicationJob
  queue_as :default

  def perform(id)
    upload = Upload.find(id)

    ::Extractor.new(upload.document).read
  end
end
