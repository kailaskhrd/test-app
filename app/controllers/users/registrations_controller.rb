# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    #super
    build_resource({})
    resource.build_address
    respond_with self.resource
  end

  # POST /resource
  def create
    super
    if resource.persisted?
      resource.roles << end_user_role
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      added_attrs = [:name, :email, :password, :password_confirmation, :remember_me, :profile_photo, :address_attributes=> [:line_1, :line_2, :city, :state, :pincode, :landmark]]
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    end

  # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      added_attrs = [:name, :email, :profile_photo, :address_attributes=> [:line_1, :line_2, :city, :state, :pincode, :landmark]]
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

    def end_user_role
      @end_user_role ||=Role.find_by(name: 'user')
    end
end
