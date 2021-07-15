class ExpensesController < ApplicationController
  def index
    @deputy = Deputy.find(params[:deputy_id])
    @expenses = @deputy.expenses.order_by_date.page params[:page]
  end
end
