class DropTaggeridInTagging < ActiveRecord::Migration
  def change
    remove_column :tagging, :tagger_id
  end
end
