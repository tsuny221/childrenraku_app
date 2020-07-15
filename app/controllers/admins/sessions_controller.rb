# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  before_action :reject_admin, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def reject_admin
    @admin = Admin.find_by(email: params[:admin][:email].downcase)
    if @admin
      if @admin.valid_password?(params[:admin][:password]) && (@admin.active_for_authentication? == false)
        flash[:danger] = "退会済みです。"
        redirect_to new_admin_session_path
      end
    else
      flash[:danger] = "必須項目を入力してください。"
    end
  end
end
