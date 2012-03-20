require "bundler/capistrano"
load 'deploy/assets'

set :application, "Damian Galarza.com"
set :repository,  "git@github.com:dgalarza/damian_rails.git"

default_run_options[:pty] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'capistrano'
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/damiangalarza.com"
set :use_sudo, false

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
set :default_environment, { 'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }

ssh_options[:forward_agent] = true

role :web, "stage.damiangalarza.com"                          # Your HTTP server, Apache/etc
role :app, "stage.damiangalarza.com"                          # This may be the same as your `Web` server
role :db,  "stage.damiangalarza.com", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

def db_info
  require 'yaml'
  YAML::load_file('config/database.yml')
end

namespace :db do
  task :pull, :roles => :db do
    database = db_info

    filename = "dump.#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.sql"

    run "mysqldump --no-create-db -u #{database['production']['username']} --password=#{database['production']['password']} #{database['production']['database']} > /tmp/#{filename}"
    get "/tmp/#{filename}", filename
    run_locally "mysql -u #{database['development']['username']} --password=#{database['development']['password']} #{database['development']['database']} < #{filename}; rm -f #{filename}"
  end

  task :push, :roles => :db do
    database = db_info

    filename = "dump.#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.sql"

    run_locally "mysqldump --no-create-db -u #{database['development']['username']} --password=#{database['development']['password']} #{database['development']['database']} > /tmp/#{filename}"
    upload "/tmp/#{filename}", "/tmp/#{filename}"
    run "mysql -u #{database['production']['username']} --password=#{database['production']['password']} #{database['production']['database']} < /tmp/#{filename}; rm -f /tmp/#{filename}"
  end
end
