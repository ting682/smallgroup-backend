class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :user_id, :localTime
  has_many :passages
  has_many :comments
  belongs_to :user
end
