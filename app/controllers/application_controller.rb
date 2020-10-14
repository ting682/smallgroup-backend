class ApplicationController < ActionController::API
    
    include ::ActionController::Cookies

    def logged_in?
        if session[:user_id]
            true
        else
            false
        end
    end

    def current_user
        @user ||= User.find(session[:user_id])
    end

    def require_login
        if session.include? :user_id
        
        else
            flash[:error] = "You need to be logged in to perform this action."
            redirect_to "/login"
        end
    end
end
