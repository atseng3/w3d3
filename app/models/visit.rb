class Visit < ActiveRecord::Base
  attr_accessible :visitor_id, :short_url_id

  validates :visitor_id, :short_url_id, :presence => true

  belongs_to(
  :shortened_url,
  :primary_key => :id,
  :foreign_key => :short_url_id,
  :class_name => 'Shortenedurl'
  )

  belongs_to(
  :user,
  :primary_key => :id,
  :foreign_key => :visitor_id,
  :class_name => 'User'
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!(:visitor_id => user.id, :short_url_id => shortened_url.id)
  end

end