class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, :null => false
      t.string :username, :limit => 32
      t.string :email, :limit => 80
      t.string :website
      t.string :comment
      t.timestamps
    end
  end
end
