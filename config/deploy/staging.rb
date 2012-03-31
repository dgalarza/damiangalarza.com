role :web, "stage.damiangalarza.com"                          # Your HTTP server, Apache/etc
role :app, "stage.damiangalarza.com"                          # This may be the same as your `Web` server
role :db,  "stage.damiangalarza.com", :primary => true # This is where Rails migrations will run
