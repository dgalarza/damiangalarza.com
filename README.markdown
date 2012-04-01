# DamianGalarza.com


## Server Setup

This application should have the following dependencies installed:

```
build-essential git-core mysql-server libssl-dev zlib1g-dev zsh htop python-software-properties python-setuptools python-pygments apache2-mpm-event curl libcurl4-openssl-dev apache2-prefork-dev libapr1-dev libxslt-dev libxml2-dev libaprutil1-dev  
```

Along with these, nodejs should be installed as well as the asset pipeline requires a JavaScript runtime to be installed on the server.

### Ubuntu nodejs Install

```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```

### Ruby Installation

RVM is used for managing Ruby installations.

### Required Gems

````
gem install bundler passenger 
```

### Amazon AWS Credentials

Amazon AWS Credentials should be stored as environment variables on the server.

### Asset Pipeline

Assets are currently compiled on the remote server and pushed to Amazon S3 on deployment.

### Rolling Rails Logs

Make use of Linux's logrotate functionality: http://www.nullislove.com/2007/09/10/rotating-rails-log-files/

### Cronjobs

* Daily at 4am - Push sitemap to search engines
* Daily at 5am - Backup database to Amazon S3

## Database Configuration

config/database.yml is not stored in repository. Instead create your own based off config/database.sample.ym

Production systems should have a database.yml config inside of the Capistrano shared/config directory, this will auto symlink into
the appropriate config directory on release.

### Database Deployment Tools

The following capistrano tasks are implemented for pushing or pulling a database to / from production. Useful for pulling production data onto developer environment.

**NOTE** pushing a database will erase the production system and update it with the local database contentas

## TODO

* Caching + Cache sweepers
* Compile assets for asset pipeline locally and push to S3 instead of compiling on production server
* Automate server setup
