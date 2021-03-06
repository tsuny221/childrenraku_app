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
      flash.now[:warning] = "ルームキーが見つかりません"
      render 'rooms/check'
     end
  end

  # POST /resource
  # ユーザーを作成した後にfamilyを作成　save!で念のためバリデーションをかけたりしたときにエラーを吐くようにしている
  def create
    @room = Room.find_by(id: params[:user][:room_id])
    super do
      # yieldを利用して書き換え
      if resource.persisted?
        family = Family.new
        family.room_id = @room.id
        family.save!
        resource.update!(family_id: family.id)
      end
    end
  end

  #   @room = Room.find_by(id: params[:user][:room_id])
  #   # パラメータから@roomを再度探す
  #   @family = Family.new
  #   @family.room_id = @room.id
  #   ActiveRecord::Base.transaction do
  #     @family.save!
  #     # familiesテーブルの作成
  #     params[:user][:family_id] = @family.id
  #     # 作成したfamilyのidを入れる。hiddenは必要ない。
  #     build_resource(sign_up_params)
  #     resource.save
  #     yield resource if block_given?
  #     if resource.persisted?
  #       if resource.active_for_authentication?
  #         set_flash_message! :notice, :signed_up
  #         sign_up(resource_name, resource)
  #         respond_with resource, location: after_sign_up_path_for(resource)
  #       else
  #         set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
  #         expire_data_after_sign_in!
  #         respond_with resource, location: after_inactive_sign_up_path_for(resource)
  #       end
  #     else
  #       clean_up_passwords resource
  #       set_minimum_password_length
  #       respond_with resource
  #     end
  #   end
  # rescue ActiveRecord::RecordInvalid
  #   redirect_to root_path
  # end

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
  def after_sign_up_path_for(resource)
    new_users_child_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
