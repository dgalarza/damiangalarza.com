class PostPublishDate < ActiveRecord::Migration
  def up
    add_column :posts, :publish_date, :datetime, :null => true
  end

  def down
    remove_column :posts, :publish_date
  end
end
