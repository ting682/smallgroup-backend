class PassageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :book, :chapter, :verse
  has_many :topics
end
