class PostSlug < ActiveRecord::Migration
  def up
    add_column :posts, :slug, :string
    add_index :posts, :slug, :unique => true
  end

  def down
    remove_column :posts, :slug
  end
end
