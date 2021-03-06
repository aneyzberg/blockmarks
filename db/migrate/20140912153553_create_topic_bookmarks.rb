class CreateTopicBookmarks < ActiveRecord::Migration
  def change
    create_table :topic_bookmarks do |t|
      t.references :topic, index: true
      t.references :bookmark, index: true

      t.timestamps
    end

    remove_column :bookmarks, :topic_id
  end
end
