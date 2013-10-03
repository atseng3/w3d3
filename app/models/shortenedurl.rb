class Shortenedurl < ActiveRecord::Base
  attr_accessible :long_url, :short_url, :submitter_id
  # attr_reader :long_url
  validates :long_url, :short_url, :submitter_id, :presence => true
  validates :short_url, :uniqueness => true

  belongs_to(
    :submitter,
    :primary_key => :id,
    :foreign_key => :submitter_id,
    :class_name => 'User'
  )

  has_many(
    :visits,
    :primary_key => :id,
    :foreign_key => :short_url_id,
    :class_name => 'Visit'
  )

  has_many(
  :tags,
  :primary_key => :id,
  :foreign_key => :short_url_id,
  :class_name => 'Tagging'
  )

  has_many :visitors, :through => :visits, :source => :user, :uniq => true
  has_many :tags, :through => :taggings, :source => :tag_topic

  def self.random_code
    short_url = SecureRandom.urlsafe_base64
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = Shortenedurl.random_code
    until !Shortenedurl.find_by_short_url(short_url)
      short_url = Shortenedurl.random_code
    end
      Shortenedurl.create!(:long_url => long_url, :short_url => short_url, :submitter_id => user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques

    self.visits.where(:created_at => (10.minutes.ago..created_at)).count
  end

  #   count = 0
  #   self.visits.each do |visit|
  #     if visit.created_at > 10.minutes.ago
  #       count += 1
  #     end
  #   end
  #   count
  # end

end