class CommentMarkdownCache < ActiveRecord::Migration
  def up
    add_column :comments, :markdown_cache, :text, :limit => 2147483647
  end

  def down
    remove_column :comments, :markdown_cache
  end
end
