class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_only
  	if current_user
      redirect_to root_path, notice: "Vous devez être administrateur pour accéder à cette page" if !current_user.is_admin
    end
  end
end
