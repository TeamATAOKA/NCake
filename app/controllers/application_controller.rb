class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

protected
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	  	admin_home_top_path
	  when User
	    home_top_path
	  end
	end


	def after_sign_out_path_for(resource_or_scope)
		url = request.referer
	    if url.include?("admin")
	      new_admin_session_path
	    else
	      home_top_path
	    end
	end

	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postcode, :address, :phone_number, :password, :password_confirmation])
    end

end
