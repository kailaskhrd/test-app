class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  after_action :verify_authorized
  def index
    authorize User
    @users = User.all_users.includes(:profile_photo_attachment).includes(:profile_photo_blob)
    @users = @users.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    authorize current_user
  end

  def update
    authorize current_user
    if @user.update(user_update_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    def user_update_params
      params.require(:user).permit(policy(User).permitted_update_attributes)
    end

    def set_user
      @user = User.all_users.where(id: params[:id]).first
    end
end
