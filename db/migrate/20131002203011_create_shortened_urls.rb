class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortenedurls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :submitter_id
      t.timestamps
    end

    add_index :shortenedurls, :submitter_id
    add_index :shortenedurls, :short_url, :unique => true
  end
end
