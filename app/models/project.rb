class Project < ApplicationRecord
  has_many :employee_projects ,dependent: :destroy
  has_many :employees, through: :employee_projects
  belongs_to :department
  validates :name, presence: true, length: {minimum: 6}, uniqueness: true
  validates :description, presence: true
  validates :department_id, presence: true
end
