class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def list?
    user.employee.admin?
  end

  def new?
    user.employee.admin?
  end

  def edit?
    user.employee.admin?
  end

  def delete?
    user.employee.admin?
  end

end
