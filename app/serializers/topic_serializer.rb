class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :user_id, :localTime, :passage_ids, :comment_ids
  has_many :passages
  has_many :comments
  belongs_to :user
end
