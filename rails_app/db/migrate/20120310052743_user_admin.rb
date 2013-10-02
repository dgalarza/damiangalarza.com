class UserAdmin < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, :default => 0
  end

  def down
    remove_column :users, :admin
  end
end
