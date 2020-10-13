class Topic < ApplicationRecord
    belongs_to :user
    has_many :topic_passages
    has_many :passages, :through => :topic_passages

end
