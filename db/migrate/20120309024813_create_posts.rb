class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, :null => false
      t.integer :category_id
      t.boolean :published
      t.string :title
      t.text :content, :limit => 4294967295
      t.timestamps
    end

    add_index :posts, :author_id
    add_index :posts, :category_id

  end
end
