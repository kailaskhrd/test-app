class UserPolicy < ApplicationPolicy

  def index?
    current_user.has_right?('view users list')
  end

  def show?
    current_user.has_right?('view users list')
  end
end
