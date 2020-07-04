class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :last_name,:first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :room_id])
	#sign_upの際にnameのデータ操作を許可。
	end
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    new_admins_room_path
	  when User
	    root_path
	  end
	end

# 	def after_sign_out_path_for(resource)
# 	  if resource == :admin
#       new_admin_session_path
#     else
#         new_customer_session_path
#     end
# end

end
