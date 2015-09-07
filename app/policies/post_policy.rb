class PostPolicy < ApplicationPolicy
  # user => current_user
#   scope => Post
  def index?
    true
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.member?
       scope.where(user_id: user.id)
      elsif
        scope.none
      end
    end
  end
end
