class ReviewPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    true
  end
end
