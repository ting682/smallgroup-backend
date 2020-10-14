class Api::V1::PassagesController < ApplicationController

    def index
        user = User.find(params[:user_id])
        passages = user.passages

        render :json => passages
    end

    
end
