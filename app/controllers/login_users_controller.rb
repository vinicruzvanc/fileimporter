class LoginUsersController < ApplicationController
    skip_before_action :user_logged_in?, only: [:new, :create]

    def new
    end

    def create
        authentication = Authentication.find_by_username(params[:username])
        role = authentication.user_role
        auth_user_role = UserRole.find_by_role_name(role)

        if authentication && authentication.password == params[:password] 
            session[:current_user_id] = authentication.id

            return redirect_to root_path, notice: 'Login efetuado com sucesso'
           # return redirect_to purchasers_path, notice: 'Login efetuado com sucesso' if role == "SISTEMA"
           # return redirect_to login_path, alert: 'Usuário não possui permissão para realizar a operação, contate o administrador!' if role.nil? || role != "ADMIN" && role != "SISTEMA"
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
