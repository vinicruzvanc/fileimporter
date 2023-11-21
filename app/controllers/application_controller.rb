class ApplicationController < ActionController::Base
  before_action :user_logged_in?
  before_action :role
  helper_method :current_user

  private

    def current_user
      @_current_user ||= session[:current_user_id] &&
        Authentication.find_by(id: session[:current_user_id])
    end

    def user_logged_in?
      return redirect_to login_path, alert: 'É necessário logar no sistema para continuar!' unless current_user
    end

    def role
      role = UserRole.find(current_user.user_role_id).role_name
      return redirect_to purchasers_path, alert: 'Permissão negada' unless role == "ADMIN"
    end
end
