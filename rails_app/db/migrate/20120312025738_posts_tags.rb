class PostsTags < ActiveRecord::Migration
  def up
    create_table :posts_tags do |t|
      t.integer :post_id, :null => false
      t.integer :tag_id, :null => false
    end

    add_index :posts_tags, [:post_id, :tag_id], :unique => true
  end

  def down
    drop_table :posts_tags
  end
end
