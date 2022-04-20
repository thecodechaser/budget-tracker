# frozen_string_literal: true

class ExpensesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @expenses = []
    @total_amount = 0
    @group.group_expenses.order(created_at: :desc).each do |group_expense|
      @expenses.push(group_expense.expense)
      @total_amount += group_expense.expense.amount
    end
  end

  def new
    @expense = Expense.new
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    if @new_expense.save
      GroupExpense.create(group_id: params[:group_id], expense_id: @new_expense.id)
      redirect_to group_expenses_path(params[:group_id]), flash: { alert: 'Your transaction is registered' }
    else
      redirect_to new_group_expense_path, flash: { alert: 'Could not register your transaction' }
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
