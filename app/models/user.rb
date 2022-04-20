# frozen_string_literal: true

class User < ApplicationRecord
  has_many :groups
  has_many :expenses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 1..15 }
  validates :surname, presence: true, length: { in: 1..15 }

  # authorization for admin role
  def admin?(requested_role)
    role == requested_role.to_s
  end
end
