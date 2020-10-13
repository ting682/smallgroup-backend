class TopicPassage < ApplicationRecord
    #belongs_to :user
    belongs_to :passage
    belongs_to :topic
end
