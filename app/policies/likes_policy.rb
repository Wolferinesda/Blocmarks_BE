class LikesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  attr_reader :user, :like

  def initialize(user, like)
    @user = user
    @like = like
  end

  def create?
    user.present?
  end

  def destroy?
    user.present && (like.user_id == user.id  )
  end
end
