class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html" , status: 403
  end
end
