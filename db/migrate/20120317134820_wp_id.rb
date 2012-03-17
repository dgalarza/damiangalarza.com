class WpId < ActiveRecord::Migration
  def up
    add_column :posts, :wp_id, :integer, :null => true
  end

  def down
    remove_column :posts, :wp_id
  end
end
