class CreateTag < ActiveRecord::Migration
  def change
    create_table :tag_topic do |t|
      t.string :topic
      t.timestamps
    end
  end
end
