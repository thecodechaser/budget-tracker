# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses

  validates :name, presence: true, length: { in: 1..20 }
  validates :icon, presence: true, length: { in: 1..100 }
end
