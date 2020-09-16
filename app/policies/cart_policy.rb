class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def confirmado?
    true
  end

  def entregado?
    true
  end
end
