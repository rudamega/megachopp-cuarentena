class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: "confirmed")
    end
  end

  def confirmado?
    true
  end

  def entregado?
    true
  end
end
