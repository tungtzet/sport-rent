class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end


  def index?
    return true
  end

  def create?
    return true
  end
  
end