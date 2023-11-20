class UserPoliciesController < ApplicationController

    before_action :user_role?
    
    def user_role?
        role = UserRole.find_by_role_name()
    end

    def show
    end
    
end
