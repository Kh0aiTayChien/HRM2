class Department < ApplicationRecord
  has_many :projects
  has_many :employees
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
