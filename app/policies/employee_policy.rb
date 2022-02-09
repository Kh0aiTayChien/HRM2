class EmployeePolicy < ApplicationPolicy
  attr_reader :user, :employee

  def initialize(user, employee)
    @user = user
    @employee = employee
  end

  def list?
    user.employee.admin?
  end
end
