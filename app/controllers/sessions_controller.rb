class SessionsController < ApplicationController

    

    def new

    end

    def create
        @user = User.find_by(email_address: params[:user][:email_address])
        if @user && @user.authenticate(params[:user][:password])
            #session[:user_id] = @user.id
            
            created_jwt = issue_token({id: user.id})
            cookies.signed[:jwt] = {value:  created_jwt, httponly: true}

        else
            render json: {
                error: "Login error: email and password do not match records."
            }, status: 404
            
        end
    end
end
