class User::ItemPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.where(user: user)
      end
    end
  
    def show?
      true
    end
  
  
    def index?
      record.user == user
    end
  
    def create?
      true
    end
  
    def destroy?
      record.user == user
    end
    
  end
  