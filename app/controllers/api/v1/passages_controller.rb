class Api::V1::PassagesController < ApplicationController

    def index
        user = User.find(params[:user_id])
        passages = user.passages

        render :json => passages
    end

    def show
        passage = Passage.find([:id])
        render :json => passage
    end

    def create
        passage = Passage.new(passage_params)
        if passage.valid?
            passage.save
            render :json => passage, status: :accepted
        else
            #error message
            render :json => {errors: passage.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update
        passage = Passage.find(params[:id])
        if passage.update(passage_params)
            render :json => passage, status: :accepted
        else
            render :json => {errors: passage.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        passage = Passage.find(params[:id])
        if passage.destroy
            render :json => Passage.all, status: :accepted
        else 
            render :json => {errors: passage.errors.full_messages}, status: :unprocessible_entity
        end
    end

    private

    def passage_params
        params.require(:passage).permit(:content, :book, :chapter, :verse, :user_id)
    end
end
