class WelcomeController < ApplicationController
  layout "empty"
  def index
    if user_signed_in?
      redirect_to form_index_path
    end
  end
end
