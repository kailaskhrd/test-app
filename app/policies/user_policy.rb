class UserPolicy < ApplicationPolicy

  def index?
    current_user.has_right?('view users list')
  end

  def edit?
    current_user.has_right?('update all user addresses')
  end

  def update?
    current_user.has_right?('update all user addresses')
  end

  def permitted_update_attributes
    [:address_attributes=> [:id, :line_1, :line_2, :city, :state, :pincode, :landmark]]
  end

  def permitted_profile_update_attributes

  end
end
