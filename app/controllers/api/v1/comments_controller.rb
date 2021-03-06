require 'pry'

class Api::V1::CommentsController < ApplicationController

    def index
        
        topic = Topic.find(params[:topic_id])
        comments = topic.comments.order(updated_at: :desc)
        render json: CommentSerializer.new(comments)
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end

    def new
        render format.html
    end

    def create
        #binding.pry
        #binding.pry
        comment = Comment.new(comment_params)
        
        if comment.valid?
            comment.save
            render :json => CommentSerializer.new(comment), status: :accepted
        else
            #error message
            render :json => {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
            render :json => comment, status: :accepted
        else
            render :json => {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy

        
        comment = Comment.find(params[:id])
        if comment.destroy
            render :json => Comment.all, status: :accepted
        else 
            render :json => {errors: comment.errors.full_messages}, status: :unprocessible_entity
        end
    end

    private

    def comment_params
        
        params.require(:comment).permit(:topic_id, :content, :user_id)
    end 
end
