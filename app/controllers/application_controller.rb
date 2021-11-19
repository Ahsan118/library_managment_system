class ApplicationController < ActionController::Base
before_action :authenticate_user!
	def after_sign_in_path_for(resource)
  		if(current_user.admin?)
  		admin_dashboards_path
  		else
  		student_dashboards_path	
     	end

  	end
end
