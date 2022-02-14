class Department < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :employees
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def pm_user
    employees.where(is_pm: true)
  end
end
