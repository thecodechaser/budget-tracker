# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses#index', type: :feature do
  describe 'Expense' do
    before(:each) do
      @user = User.create(name: 'Ranjeet', surname: 'Singh', email: 'amy@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'amy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @group = Group.create(user: @user, name: 'Cars', icon: 'https://icon-link')

      @expense1 = Expense.create(user: @user, name: 'Food', amount: 5)
      @expense2 = Expense.create(user: @user, name: 'Car', amount: 5)
      @expense3 = Expense.create(user: @user, name: 'Drink', amount: 5)
      @expense4 = Expense.create(user: @user, name: 'Oil', amount: 5)

      @group_expense = GroupExpense.create(group: @group, expense: @expense1)

      visit(group_expenses_path(@group.id))
    end

    it 'shows the expense name' do
      expect(page).to have_content('Food')
    end

    it 'shows the expense amount' do
      expect(page).to have_content('5')
    end
  end
end
