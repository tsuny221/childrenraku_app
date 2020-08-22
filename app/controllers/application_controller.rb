class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # CSRF対策(クロスサイトリクエストフォージェリ)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id, :family_id])
    # sign_upの際のデータ操作を許可。
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id, :family_id])
    #:inviteと:accept_invitationに招待の際のデータ操作を許可。
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id, :family_id])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_top_path
    when User
      users_events_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  # ルームを作成したかどうかチェック
  def room_check
    if current_admin.room.blank?
      @room = Room.new
      render 'admins/rooms/new'
    end
  end

  # 児童情報を作成したかどうかチェック
  def child_check
    if Child.find_by(family_id: current_user.family_id).blank?
      @child = Child.new
      render 'users/children/new'
    end
  end
end
