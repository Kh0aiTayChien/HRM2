class EmployeePolicy < ApplicationPolicy
  attr_reader :user, :employee

  def initialize(user, employee)
    @user = user
    @employee = employee
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
