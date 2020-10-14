class Api::V1::TopicsController < ApplicationController

    def index
        user = User.find(params[:user_id])
        topics = user.topics

        render :json => topics
    end

    def show
        topic = Topic.find(params[:id])

        render json: topic
    end
end
