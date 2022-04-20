# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.all
    @total_amount = []

    @groups.each do |group|
      total = 0
      group.group_expenses.each do |group_expense|
        total += group_expense.expense.amount
      end
      @total_amount.push(total)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @new_group = current_user.groups.new(group_params)
    if @new_group.save
      redirect_to groups_path, flash: { alert: 'Your category is registered' }
    else
      redirect_to new_group_path, flash: { alert: 'Could not register your category' }
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
