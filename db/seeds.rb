# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
wp_client = Mysql2::Client.new(:host => 'localhost', :username => 'dg_dev', :password => 'er1nb3rmud3z', :database => 'dev_dg_wordpress')
posts = wp_client.query('SELECT post_date, post_content, post_title, post_modified FROM dgwp_posts')

posts.each do |post|
  Post.create(:user_id => 1, :content => post['post_content'], :title => post['post_title'], :published => 1, :created_at => post['post_date'], :updated_at => post['post_modified'])
end
