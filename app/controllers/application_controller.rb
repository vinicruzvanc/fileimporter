class ApplicationController < ActionController::Base
  before_action :user_logged_in?
  before_action :user_role?

  #adicionar um before_action para o user_role? e certificar que somente o admin pode fazer qualquer coisa

  private

    def current_user
      @_current_user ||= session[:current_user_id] &&
        Authentication.find_by(id: session[:current_user_id])
    end

    def user_logged_in?
      return redirect_to login_path, alert: 'É necessário logar no sistema para continuar!' unless current_user
    end

    def user_role?
    #implementar uma lógica para achar o role_name
      
      
    end

end
