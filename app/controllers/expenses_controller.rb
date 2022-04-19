class ExpensesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @expenses = [] 
    @group.group_expenses.each do |group_expense|
      @expenses.push(group_expense.expense)
    end
  end

  def new
    @expense = Expense.new
  end

  def create
    @new_expense = current_user.expense.new(expense_params)
    if @new_expense.save
      GroupExpense.create(group_id: params[:group_id], expense_id: @new_expense.id)
      redirect_to group_expenses_path(params[:group_id]), flash: { alert: 'Your transaction is registered' }
    else
      redirect_to new_group_expense_path, flash: { alert: 'Could not register your transaction' }
    end
  end

  def expense_params
    params.require(:group).permit(:name, :amount)
  end
end