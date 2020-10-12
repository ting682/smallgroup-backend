class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(email_address: params[:user][:email_address])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        

        else
            flash[:error] = "Login error: email and password do not match records."
            redirect_to "/login"
        end
    end
end
