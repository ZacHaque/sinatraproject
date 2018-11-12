#!/bin/bash
sudo apt update -y
sudo apt install ruby -y
sudo apt install nginx -y
sudo apt install git -y
sudo gem install sinatra --no-ri --no-rdoc
sudo apt install ruby-bundler -y


#Clone the app from the GitHub
sudo git clone  https://github.com/ZacHaque/sinatraproject/

#Copy nginx Configuration to listen on port 80 and forward traffic to port 9292
sudo cp sinatraproject/default /etc/nginx/sites-enabled/
sudo chmod 777 /etc/nginx/sites-enabled/default
sudo service nginx restart

cd sinatraproject

bundle install
bundle exec rackup
