class ExpensesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @expenses = [] 
    @group.group_expenses.each do |group_expense|
      @expenses.push(group_expense.expense)
    end
  end
end