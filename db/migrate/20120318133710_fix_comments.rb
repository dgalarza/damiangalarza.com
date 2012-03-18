class FixComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, :null => false
      t.integer :wp_id, :null => true
      t.integer :parent_id, :null => true
      t.string :ip, :null => true, :limit => 100
      t.string :username, :limit => 32
      t.string :email, :limit => 80
      t.string :website
      t.text :comment
      t.timestamps
    end

    add_index :comments, :post_id
  end
end
