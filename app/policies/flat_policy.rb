class FlatPolicy < ApplicationPolicy
  attr_reader :user, :flat

  def initialize(user, flat)
    @user = user
    @flat = flat
  end

  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    user == flat.user
  end

  def destroy?
    user == flat.user
  end
end
