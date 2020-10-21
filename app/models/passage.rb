class Passage < ApplicationRecord

    belongs_to :user
    has_many :topic_passages
    has_many :topics, :through => :topic_passages

    validates :content, presence: true
end
