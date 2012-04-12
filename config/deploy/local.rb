#role :web, "192.168.22.130"                          # Your HTTP server, Apache/etc
#role :app, "192.168.22.130"                          # This may be the same as your `Web` server
#role :db,  "192.168.22.130", :primary => true # This is where Rails migrations will run

role :web, "192.168.104.132"                          # Your HTTP server, Apache/etc
role :app, "192.168.104.132"                          # This may be the same as your `Web` server
role :db,  "192.168.104.132", :primary => true # This is where Rails migrations will run

require 'capistrano-unicorn'
