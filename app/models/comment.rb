class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :topic

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
        return self.updated_at.localtime.strftime("Posted on %B %e, %Y %l:%M%p")
    end
end
