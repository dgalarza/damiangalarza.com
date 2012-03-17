class WpCommentId < ActiveRecord::Migration
  def up
    add_column :comments, :wp_id, :integer, :null => true
  end

  def down
    remove_column :comments, :wp_id
  end
end
