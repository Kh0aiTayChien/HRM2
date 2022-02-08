class Employee < ApplicationRecord
  belongs_to :department, optional: true
  belongs_to :project, optional: true
  belongs_to :user
  has_many :projects, through: :employee_projects
  has_many :employee_projects
  belongs_to :role, optional: true
  has_one :employee_file
  accepts_nested_attributes_for :employee_file
end
