class ExpensesController < ApplicationController
  def index
    @deputy = Deputy.friendly.find(params[:deputy_id])
    @expenses = @deputy.expenses.order_by_date.page params[:page]
    @charts = Deputy::Charts.new(@deputy)
  end
end
