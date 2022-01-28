class Project < ApplicationRecord
  has_many :employee_projects
  has_many :employees, through: :employee_projects
  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true
  validates :department_id, presence: true
end
