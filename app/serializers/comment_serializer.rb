class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :topic_id, :content, :topic_title, :name, :email, :localTime
  belongs_to :user

end
