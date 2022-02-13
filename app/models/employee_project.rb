class EmployeeProject < ApplicationRecord
  belongs_to :project
  belongs_to :employee
  validates :project_id, uniqueness: { scope: :employee_id, message: "Người này đã tồn tại trong dự án" }
  validates :employee_id, presence: true
  validates :is_leader, presence: true
  validates :time_assign, presence: true
end
