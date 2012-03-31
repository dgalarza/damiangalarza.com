role :web, "damiangalarza.com"                          # Your HTTP server, Apache/etc
role :app, "damiangalarza.com"                          # This may be the same as your `Web` server
role :db,  "damiangalarza.com", :primary => true # This is where Rails migrations will run

require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2'
