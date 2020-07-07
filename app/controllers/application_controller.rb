class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id, :family_id])
    # sign_upの際のデータ操作を許可。
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id, :family_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id, :family_id])
      #:inviteと:accept_invitationに招待の際のデータ操作を許可。
    end
end
