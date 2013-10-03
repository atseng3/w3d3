class User < ActiveRecord::Base
  attr_accessible :email
  validates :email, :presence => true, :uniqueness => true

  has_many(
    :submitted_urls,
    :primary_key => :id,
    :foreign_key => :submitter_id,
    :class_name => 'Shortenedurl'
  )

  has_many(
  :visits,
  :primary_key => :id,
  :foreign_key => :visitor_id,
  :class_name => 'Visit'
  )

  has_many(
  :taggings,
  :primary_key => :id,
  :foreign_key => :tagger_id,
  :class_name => 'Tagging'
  )

  has_many :visited_urls, :through => :visits, :source => :shortened_url
  has_many :tags, :through => :tagging, :source => :tag_topic
end