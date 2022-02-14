class EmployeeProject < ApplicationRecord

  belongs_to :project
  belongs_to :employee

  validates :project_id, uniqueness: { scope: :employee_id, message: "Người này đã tồn tại trong dự án" }
  with_options presence: true do
    validates :employee_id
    validates :is_leader
    validates :time_assign
  end

end
