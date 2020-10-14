class Api::V1::CommentsController < ApplicationController

    def index
        
        topic = Topic.find(params[:topic_id])
        comments = topic.comments
        render json: comments
    end


end
