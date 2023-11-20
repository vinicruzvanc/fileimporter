class AuthenticationUsersController < ApplicationController
    before_action :find_user_id, only: [:show, :edit, :update, :destroy]
    before_action :list_user_roles, only: [:new, :edit, :create, :update]

    def find_user_id
       @authentication = Authentication.find(params[:id])
    end

    def list_user_roles
        @user_roles = UserRole.all.map{ |string| [string.role_name, string.id] }
    end

    def index
        @authentication_users = Authentication.order(:username).page(params[:page])
    end
    
    def show
    end

    def new
        @authentication = Authentication.new
    end

    def create
        @authentication = Authentication.new(auth_params)
        
        if @authentication.save
            redirect_to authentications_path, notice: 'Usuário cadastrado com sucesso'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @authentication.update(auth_params)
            redirect_to authentications_path, notice: 'Usuário editado com sucesso'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @authentication.destroy

        redirect_to authentications_path, notice: 'Usuário deletado com sucesso'
    end

    private
        def auth_params
            params.require(:authentication).permit(:username, :password, :password_confirmation, :user_role_id)
        end
end
