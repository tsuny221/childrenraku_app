# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @room = Room.find_by(key: params[:room_key])
    # room#newのformから持ってきたパラメーター
    if @room.present?
      super
    else
      # @roomがない＝一致するものがないということ
      flash[:notice] = "ルームキーが見つかりません"
      render 'rooms/new'
    end
end

  # POST /resource
  def create
    @room = params[:user][:room_id]
    @family = Family.new
    @family.room_id = @room.to_i
    # stringなので数字に変換
    @family.save
    # familiesテーブルの作成
    params[:user][:family_id] = @family.id
    # 作成したfamilyのidを入れる。hiddenは必要ない。
    super
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
