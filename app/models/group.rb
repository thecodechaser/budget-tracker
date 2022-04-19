class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses

end