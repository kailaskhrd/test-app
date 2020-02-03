class UsersController < ApplicationController
  after_action :verify_authorized
  def index
    authorize User
    @users = User.all_users.includes(:profile_photo_attachment).includes(:profile_photo_blob)
    @users = @users.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
