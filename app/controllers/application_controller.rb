class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
<<<<<<< HEAD
    flash[:authorization_error] = "Not authorized to perform that action ❌"
    redirect_to listings_path
  end 
end
=======
    render file: "#{Rails.root}/public/403.html" , status: 403
  end
end
>>>>>>> 1a12abd26f8d15c38de83db6093a292144171a44
