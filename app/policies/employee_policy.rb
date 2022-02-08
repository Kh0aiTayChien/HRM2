class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def list?
    @employee.has_role? :Admin
  end
end
