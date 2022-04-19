# frozen_string_literal: true

class GroupExpense < ApplicationRecord
  belongs_to :group
  belongs_to :expense
end
