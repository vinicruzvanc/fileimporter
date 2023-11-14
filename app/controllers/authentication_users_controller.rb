class AuthenticationUsersController < ApplicationController
    
    def index
        @authentication_users = Authentication.all
    end
    
    def show
    
    end

    def new
        @authentication = Authentication.new
    end

    def create
        @authentication = Authentication.new(auth_params)
        
        if @authentication.save
            redirect_to authentication_users_path, notice: 'Dados importados com sucesso!'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @authentication = Authentication.find(params[:id])
    end

    def update
        
    end

    private
        def auth_params
            params.require(:authentication).permit(:username, :password, :password_confirmation)
        end

end
