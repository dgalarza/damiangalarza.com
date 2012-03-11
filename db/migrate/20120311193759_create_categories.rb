class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false
      t.integer :category_parent, :default => 0
      t.timestamps
    end
  end
end
