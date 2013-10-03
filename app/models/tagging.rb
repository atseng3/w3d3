class Tagging
  attr_accessible :tag_topic_id, :tagger_id, :short_url_id

  belongs_to(
  :tag_topic,
  :primary_key => :id,
  :foreign_key => :tag_topic_id,
  :class_name => 'TagTopic'
  )

  belongs_to(
  :user,
  :primary_key => :id,
  :foreign_key => :tagger_id,
  :class_name => 'User'
  )

  belongs_to(
  :shortened_url,
  :primary_key => :id,
  :foreign_key => :short_url_id,
  :class_name => 'Shortenedurl'
  )

end