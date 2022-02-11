class UserPolicy < ApplicationPolicy
  attr_reader :user, :users

  def initialize(user, users)
    @user = user
    @users = users
  end

  def list?
    user.employee.admin?
  end

  def delete?
    user.employee.admin?
  end

end
