class PostUpdates < ActiveRecord::Migration
  def up
    add_column :posts, :excerpt, :text, :null => true
    add_column :posts, :subtitle, :string, :limit => 50, :null => true
  end

  def down
    remove_column :posts, :excerpt
    remove_column :posts, :subtitle
  end
end
