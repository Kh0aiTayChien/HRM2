class ProjectEmployeePolicy < ApplicationPolicy
  attr_reader :user, :project_employee

  def initialize(user, project_employee)
    @user = user
    @project_employee = project_employee
  end

  def index?
    user.employee.admin? || user.employee.leader?
  end
end
