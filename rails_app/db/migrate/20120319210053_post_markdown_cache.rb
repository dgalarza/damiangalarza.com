class PostMarkdownCache < ActiveRecord::Migration
  def up
    add_column :posts, :cached_markdown, :text, :limit => 2147483647
  end

  def down
    remove_column :posts, :cached_markdown
  end
end
