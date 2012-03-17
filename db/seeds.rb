# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

wp_client = Mysql2::Client.new(:host => 'localhost', :username => 'dg_dev', :password => 'er1nb3rmud3z', :database => 'dev_dg_wordpress')

#posts = wp_client.query('SELECT id, post_date, post_content, post_title, post_modified FROM dgwp_posts')
#posts.each do |post|
  #p "Finding: #{post['post_title']}"
  #_post = Post.where(:title => post['post_title']).first
  #if _post
    #_post.wp_id = post['id']
    #_post.save
  #end
#end

#posts.each do |post|
  #Post.create(:user_id => 1, :content => post['post_content'], :title => post['post_title'], :published => 1, :created_at => post['post_date'], :updated_at => post['post_modified'])
#end

comments = wp_client.query('SELECT comment_ID, comment_post_ID, comment_author, comment_author_email, comment_author_url, comment_date_gmt, comment_content, comment_parent, comment_author_IP FROM dgwp_comments')

comments.each do |comment|

  if comment['comment_parent'] > 0
    comment_parent = comments.find { |c| c['comment_ID'] == comment['comment_parent']} 
    comment_parent = comment_parent['comment_ID']
  else
    comment_parent = nil
  end

  _post = Post.where(:wp_id => comment['comment_post_ID']).first
  unless _post.nil?
    _post.comments.create(
      :wp_id => comment['comment_ID'],
      :username => comment['comment_author'],
      :email => comment['comment_author_email'],
      :website => comment['comment_author_url'],
      :comment => comment['comment_content'],
      :ip => comment['comment_author_IP'],
      :created_at => comment['comment_date_gmt'],
      :parent_id => comment_parent
    )
  end

end
