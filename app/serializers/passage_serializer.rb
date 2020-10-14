class PassageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :book, :chapter, :verse, :topic_ids
  has_many :topics
end
