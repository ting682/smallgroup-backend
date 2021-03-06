class Api::V1::TopicsController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        #user = User.find(params[:user_id])
        topics = Topic.all.order(updated_at: :asc)

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
        #binding.pry
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
        #binding.pry
        if topic.user == current_user && topic.update(topic_params)
            #binding.pry
            render :json => TopicSerializer.new(topic), status: :accepted
        else
            #binding.pry
            render :json => {errors: 'Invalid update', status: :unprocessible_entity}
            
        end
    end

    def destroy
        #binding.pry
        topic = Topic.find(params[:id])
        

        if current_user == topic.user && topic.destroy
            render :json => TopicSerializer.new(topic), status: :accepted
        else 
            render :json => {errors: 'Invalid deletion', status: :unprocessible_entity }
        end
    end

    private

    def topic_params
        params.require(:topic).permit!
    end
end
