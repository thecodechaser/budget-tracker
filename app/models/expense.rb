# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses

  validates :name, presence: true, length: { in: 1..20 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
