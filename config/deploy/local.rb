role :web, "192.168.22.130"                          # Your HTTP server, Apache/etc
role :app, "192.168.22.130"                          # This may be the same as your `Web` server
role :db,  "192.168.22.130", :primary => true # This is where Rails migrations will run

require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2'
