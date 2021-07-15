module ExpensesHelper
  def date_formatter(value)
    value&.strftime("%d/%m/%Y")
  end
end
