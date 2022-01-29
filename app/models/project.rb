class Project < ApplicationRecord
  has_many :employee_projects
  has_many :employees, through: :employee_projects
  belongs_to :department
  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true
  validates :department_id, presence: true
end
