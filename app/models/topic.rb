class Topic < ApplicationRecord
    belongs_to :user

    has_many :comments
    has_many :users
    has_many :topic_passages
    has_many :passages, :through => :topic_passages


    def localTime
        return self.updated_at.localtime.strftime("%B %e, %Y %l:%M%p")
    end

    def name
        return self.user.name
    end
end
