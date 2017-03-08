class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    form_index_path
  end
    def layout_by_resource
      if devise_controller?
        "empty"
      end
  end
end
