require "bundler/capistrano"
require "whenever/capistrano"
load 'deploy/assets'

set :stages, %w(production staging local)

require 'capistrano/ext/multistage'

set :application, "Damian Galarza.com"
set :repository,  "git@github.com:dgalarza/damian_rails.git"

set :whenever_command, "bundle exec whenever"

default_run_options[:pty] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'capistrano'
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/damiangalarza.com"
set :use_sudo, false

set :keep_releases, 4

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

ssh_options[:forward_agent] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_db do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :symlink_public_share do
    run "ln -nfs #{shared_path}/public #{release_path}/public/shared"
  end

  task :s3_asset_compile do
    run_locally "bundle exec rake assets:precompile"
  end

end

task :refresh_sitemaps do
  run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rake sitemap:refresh"
end

# Open the remote database config to parse credentials for pull
# since we do not store the database config in the repo
def remote_db_info
  require 'yaml'
  file = capture "cat #{shared_path}/config/database.yml"
  YAML::load file
end

def local_db_info
  require 'yaml'
  YAML::load_file 'config/database.yml'
end

namespace :db do
  task :pull, :roles => :db do
    remote_database = remote_db_info
    local_database = local_db_info

    filename = "dump.#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.sql"

    run "mysqldump --no-create-db -u #{remote_database['production']['username']} --password=#{remote_database['production']['password']} #{remote_database['production']['database']} > /tmp/#{filename}"
    get "/tmp/#{filename}", filename
    run_locally "mysql -u #{local_database['development']['username']} --password=#{local_database['development']['password']} #{local_database['development']['database']} < #{filename}; rm -f #{filename}"
  end

  task :push, :roles => :db do
    remote_database = remote_db_info
    local_database = local_db_info

    filename = "dump.#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.sql"

    run_locally "mysqldump --no-create-db -u #{local_database['development']['username']} --password=#{local_database['development']['password']} #{local_database['development']['database']} > /tmp/#{filename}"
    upload "/tmp/#{filename}", "/tmp/#{filename}"
    run "mysql -u #{remote_database['production']['username']} --password=#{remote_database['production']['password']} #{remote_database['production']['database']} < /tmp/#{filename}; rm -f /tmp/#{filename}"
  end
end

after 'deploy:update_code', 'deploy:symlink_db'
after 'deploy:update_code', 'deploy:symlink_public_share'
after 'deploy', 'refresh_sitemaps'
