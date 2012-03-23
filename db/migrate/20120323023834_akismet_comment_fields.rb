class AkismetCommentFields < ActiveRecord::Migration
  def up
    add_column :comments, :user_agent, :string
    add_column :comments, :referrer, :string
    add_column :comments, :approved, :boolean, :default => false, :null => false
  end

  def down
    remove_column :comments, :user_agent
    remove_column :comments, :referrer
    remove_column :comments, :approved
  end
end
