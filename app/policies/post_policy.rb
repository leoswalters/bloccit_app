class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.moderator?
        scope.all
      #elsif user.member?
       # scope.where(record.user) #this may not be correct
      #else
        #scope.where(:published => true)
      end
    end


  end

end
