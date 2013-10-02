def wp_client
  @db ||= Mysql2::Client.new(:host => 'localhost', :username => 'dg_dev', :password => 'er1nb3rmud3z', :database => 'dev_dg_wordpress')
end

namespace :db do
  desc 'Migrate wordpress comments into system'
  task :comment_seed => :environment do

    ActiveRecord::Base.connection.execute 'TRUNCATE comments'

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

  end

end
