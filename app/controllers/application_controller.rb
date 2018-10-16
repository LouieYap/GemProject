class ApplicationController < ActionController::Base


layout :layout_by_resource

protected

def layout_by_resource
  if devise_controller?
    "devise"
  else
    "application"
  end
end

rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert: exception.message
end

end
