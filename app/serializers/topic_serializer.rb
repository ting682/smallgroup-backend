class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :user_id, :created_at, :updated_at
  has_many :passages
  has_many :comments
  belongs_to :user
end
