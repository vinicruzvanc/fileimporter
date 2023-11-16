class ApplicationController < ActionController::Base

    private

    def current_user
        @_current_user ||= session[:current_user_id] &&
          Authentication.find_by(id: session[:current_user_id])
    end
end
