class DepartmentPolicy < ApplicationPolicy
  attr_reader :user, :department

  def initialize(user, department)
    @user = user
    @department = department
  end

  def list?
    user.employee.admin?
  end
end
