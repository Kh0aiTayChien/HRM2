class EmployeeProject < ApplicationRecord
  belongs_to :project
  belongs_to :employee

  validates :employee_id, presence: true
  validates :is_leader, presence: true
  validates :time_assign, presence: true
end
