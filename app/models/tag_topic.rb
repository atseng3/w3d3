class TagTopic
  attr_accessible :topic

  has_many(
  :tags,
  :primary_key => :id,
  :foreign_key => :tag_topic_id,
  :class_name => 'Tagging'
  )

  has_many :shortened_urls, :through => :taggings, :source => :shortened_url
  has_many :taggers, :through => :taggings, :source => :user


end