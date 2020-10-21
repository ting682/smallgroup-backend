class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :name, :localTime, :passage_ids, :comment_ids, :passages
  has_many :passages
  has_many :comments
  belongs_to :user
end
