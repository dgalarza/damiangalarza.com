require "bundler/capistrano"

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
