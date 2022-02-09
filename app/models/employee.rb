class Employee < ApplicationRecord
  belongs_to :department, optional: true
  belongs_to :project, optional: true
  belongs_to :user
  has_many :projects, through: :employee_projects
  has_many :employee_projects
  belongs_to :role, optional: true
  has_one :employee_file
  accepts_nested_attributes_for :employee_file

  # validates :name, presence: true, length: {minimum: 2}
  # validates :age, presence: true, numericality: true
  # validates :birthday, presence: true
  # validates :address, presence: true, length: {minimum: 6}
  # validates :role_id, presence: true
  # validates :user_id, uniqueness: true
end
