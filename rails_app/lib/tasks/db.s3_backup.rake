require 'aws'

namespace :db do

  desc "Backup database to Amazon S3"
  task :s3_backup => :environment do
    db_config = YAML::load_file('config/database.yml')[Rails.env]
    filename = "dgalarza.#{Time.now.strftime('%Y%m%d%H%M%S')}.sql"

    system "mysqldump -u #{db_config['username']} --password=#{db_config['password']} #{db_config['database']} > /tmp/#{filename}"
    system "tar -czvf /tmp/#{filename}.tar.gz /tmp/#{filename}"

    aws_config = {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }

    AWS.config aws_config
    s3 = AWS::S3.new
    bucket = s3.buckets['backups.damiangalarza.com']
    o = bucket.objects["#{filename}.tar.gz"]
    o.write(:file => "/tmp/#{filename}")

    system "rm -f /tmp/#{filename} /tmp/#{filename}.tar.gz"
  end

end
