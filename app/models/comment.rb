class Comment < ApplicationRecord

    include ActionView::Helpers::DateHelper

    belongs_to :user
    belongs_to :topic

    validates :content, presence: true

    def name
        return self.user.name
    end

    def email
        return self.user.email_address
    end

    def topic_title
        return self.topic.title
    end

    def localTime
        return "posted " + time_ago_in_words(self.updated_at) + " ago"
        #return self.updated_at.localtime.strftime("%B %e, %Y %l:%M%p")
    end
end
