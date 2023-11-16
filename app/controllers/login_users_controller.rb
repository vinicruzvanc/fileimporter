class LoginUsersController < ApplicationController

    def new
        @login_user = LoginUser.new
    end

    def create
        if user = User.authenticate(params[:username], params[:password])
            session[:current_user_id] = user.id
            redirect_to root_url
          end      
    end

    def destroy
        @login_user.destroy
        redirect_to new_login_user_path, alert: 'Você saiu da sessão, efetue um novo login'
    end
end
