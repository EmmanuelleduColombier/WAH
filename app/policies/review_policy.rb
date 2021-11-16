class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def new?
    create?
  end

  def create?
    true
  end
end
