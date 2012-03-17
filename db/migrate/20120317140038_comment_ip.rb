class CommentIp < ActiveRecord::Migration
  def up
    add_column :comments, :ip, :string, :null => true, :limit => 100
  end

  def down
    remove_column :comments, :ip
  end
end
