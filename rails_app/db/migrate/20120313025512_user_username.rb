class UserUsername < ActiveRecord::Migration
  def up
    add_column :users, :username, :string, :limit => 36
  end

  def down
    remove_column :users, :username
  end
end
