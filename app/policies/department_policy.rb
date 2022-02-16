class DepartmentPolicy < ApplicationPolicy
  attr_reader :user, :department

  def initialize(user, department)
    @user = user
    @department = department
  end

  def index?
    user.employee.admin? || user.employee.hr? || user.employee.leader?
  end

  def new?
    user.employee.admin?
  end

  def edit?
    user.employee.admin?
  end

  def destroy?
    user.employee.admin?
  end

end
