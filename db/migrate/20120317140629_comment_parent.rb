class CommentParent < ActiveRecord::Migration
  def up
    add_column :comments, :parent_id, :integer, :null => true
  end

  def down
    remove_column :comments, :parent_id
  end
end
