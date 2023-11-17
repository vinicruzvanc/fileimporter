class LoginUsersController < ApplicationController
    skip_before_action :user_logged_in?, only: [:new, :create]

    def new
    end

    def create
        authentication = Authentication.find_by_username(params[:username])
        
        if authentication && authentication.password == params[:password]
            session[:current_user_id] = authentication.id
            redirect_to root_path, notice: 'Login efetuado com sucesso'
        else
            redirect_to login_path, alert: 'Usuário ou senha inválidos!'
        end
    end

    def destroy
        session.delete(:current_user_id)
        @_current_user = nil
        redirect_to login_path, alert: 'Você foi deslogado, efetue o login novamente para continuar'
    end
end
