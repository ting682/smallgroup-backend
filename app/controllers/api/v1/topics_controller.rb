class Api::V1::TopicsController < ApplicationController

    def index
        user = User.find(params[:user_id])
        topics = user.topics
        options = {
            include: [:passages, :comments]
        }
        render :json => TopicSerializer.new(topics, options)
    end

    def show
        topic = Topic.find(params[:id])
        #passages = topic.passages
        options = {
            include: [:passages, :'comments']
                # :passages => {:only => [:content, :book, :chapter, :verse]},
                # :comments => {:only => [:'comments.content', :'comments.user.name']}
            
             
        }
        render json: TopicSerializer.new(topic, options)
    end

    def create
        topic = Topic.new(topic_params)
        if topic.valid?
            topic.save
            render :json => TopicSerializer.new(topic), status: :accepted
        else
            #error message
            render :json => {errors: topic.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update
        topic = Topic.find(params[:id])
        if topic.update(topic_params)
            render :json => TopicSerializer.new(topic), status: :accepted
        else
            render :json => {errors: topic.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        topic = Topic.find(params[:id])
        topics = Topic.all
        if topic.destroy
            render :json => TopicSerializer.new(topics), status: :accepted
        else 
            render :json => {errors: topic.errors.full_messages}, status: :unprocessible_entity
        end
    end

    private

    def topic_params
        params.require(:topic).permit(:content, :title, :user_id)
    end
end
