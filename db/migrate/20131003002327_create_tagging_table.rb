class CreateTaggingTable < ActiveRecord::Migration
  def change
    create_table :tagging do |t|
      t.integer :tag_topic_id
      t.integer :short_url_id
      t.integer :tagger_id
      t.timestamps
    end
  end
end
