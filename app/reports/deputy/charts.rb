class Deputy::Charts
  attr_reader :deputy

  def initialize(deputy)
    @deputy = deputy
  end

  def higher_expense_per_month
    deputy.expenses.group_by_month(:emission_date, format: "%b %Y").maximum(:net_value)
  end

  def higher_expense_per_year
    deputy.expenses.group_by_year(:emission_date, format: "%b %Y").maximum(:net_value)
  end

  def total_expense_per_month
    deputy.expenses.group_by_month(:emission_date, format: "%b %Y").sum(:net_value)
  end

  def total_expense_per_year
    deputy.expenses.group_by_year(:emission_date, format: "%b %Y").sum(:net_value)
  end
end