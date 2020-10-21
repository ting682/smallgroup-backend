class Api::V1::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
    
        if @user.save
           render :json => UserSerializer.new(@user), status: :accepted
        else

            flash[:error] = @user.errors.full_messages.to_sentence
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email_address)
    end
end
