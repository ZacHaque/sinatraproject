#!/bin/bash
sudo apt update -y
sudo apt install ruby -y
sudo apt install nginx -y
sudo apt install git -y
sudo gem install sinatra --no-ri --no-rdoc
sudo apt  install ruby-bundler -y



# make change on nginx config to forward traffic
# location / {
#    proxy_pass       http://localhost:4567;
#    proxy_set_header Host      $host;
#    proxy_set_header X-Real-IP $remote_addr;
#}


#sudo vim /etc/nginx/sites-enabled/default 
sudo git clone  https://github.com/ZacHaque/sinatraproject/
sudo cp sinatraproject/default /etc/nginx/sites-enabled/
sudo chmod 777 /etc/nginx/sites-enabled/default

sudo service nginx restart


#git clone https://github.com/rea-cruitment/simple-sinatra-app.git
#cd simple-sinatra-app



bundle install


bundle exec rackup --path /home/ubuntu/sin/simple-sinatra-app/



