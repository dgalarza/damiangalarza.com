class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, :null => false
      t.integer :category_id
      t.bool :published
      t.string :title
      t.text :content
      t.timestamps
    end

    add_index :posts, :author_id
    add_index :posts, :category_id

  end
end
