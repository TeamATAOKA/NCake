class ApplicationController < ActionController::Base

private
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	  	admin_home_top_path
	  when User
	    home_top_path
	  end
	end



	def after_sign_out_path_for(resource_or_scope)
	    if resource_or_scope == :admin_admin_user
	      new_admin_session_path
	    else
	      home_top_path
	    end
	end

end
