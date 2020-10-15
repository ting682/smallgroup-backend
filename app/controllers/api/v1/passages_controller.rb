class Api::V1::PassagesController < ApplicationController

    def index
        user = User.find(params[:user_id])
        topic = Topic.find(params[:topic_id])
        passages = topic.passages

        render :json => PassageSerializer.new(passages)
    end

    def show
        passage = Passage.find([:id])
        render :json => PassageSerializer.new(passage)
    end

    def create
        passage = Passage.new(passage_params)
        if passage.valid?
            passage.save
            render :json => PassageSerializer.new(passage), status: :accepted
        else
            #error message
            render :json => {errors: passage.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update
        passage = Passage.find(params[:id])
        if passage.update(passage_params)
            render :json => PassageSerializer.new(passage), status: :accepted
        else
            render :json => {errors: passage.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        passage = Passage.find(params[:id])
        if passage.destroy
            render :json => PassageSerializer.new(Passage.all), status: :accepted
        else 
            render :json => {errors: passage.errors.full_messages}, status: :unprocessible_entity
        end
    end

    private

    def passage_params
        params.require(:passage).permit(:content, :book, :chapter, :verse, :user_id)
    end
end
