class UserPolicy < ApplicationPolicy

  def index?
    current_user.has_right?('view users list')
  end

  def show?
    current_user.has_right?('view users list')
  end

  def permitted_attributes
    [:address_attributes=> [:line_1, :line_2, :city, :state, :pincode, :landmark]]
  end
end
