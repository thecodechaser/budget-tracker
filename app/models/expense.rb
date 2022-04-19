class Expense < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses
  
  end