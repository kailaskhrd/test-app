class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:error] = "Sorry! You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
