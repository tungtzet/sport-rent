class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @params.present?
        scope.search_by_name_and_category_and_description(@params)
      else
        scope.geocoded
      end
      
    end
  end

  def show?
    true
  end


  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
  
end
