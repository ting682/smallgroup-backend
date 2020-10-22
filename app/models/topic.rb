class Topic < ApplicationRecord
    belongs_to :user

    has_many :comments
    has_many :users
    has_many :topic_passages
    has_many :passages, :through => :topic_passages

    include ActionView::Helpers::DateHelper

    def localTime
        return time_ago_in_words(self.updated_at) + " ago"
        #return self.updated_at.localtime.strftime("%B %e, %Y %l:%M%p")
    end

    def name
        return self.user.name
    end

    def passages_attributes=(attributes_array)
        

        attributes_array.each do |attribute|
            
            #binding.pry
            if attribute['passage_id']
                passage = Passage.find(attribute['passage_id'])
                #binding.pry
                passage.content = attribute['content']
                passage.book = attribute['book']
                passage.chapter = attribute['chapter']
                passage.verse = attribute['verse']

                if passage.valid?
                    passage.save
                end

                
            else
                passage = self.passages.build(attribute)

            end
            #binding.pry
            #
            # binding.pry
            #passage.save
        end
    end
end
