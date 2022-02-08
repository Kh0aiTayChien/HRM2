class NilClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise Pundit::NotDefinedError, "Cannot scope NilClass"
    end
  end

  def list?
    false # Nobody can see nothing
  end
end
