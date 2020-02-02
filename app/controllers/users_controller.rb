class UsersController < ApplicationController
  def index
    @users = User.all_users.includes(:profile_photo_attachment).includes(:profile_photo_blob)
    @users = @users.paginate(:page => params[:page], :per_page => 5)
  end
end
