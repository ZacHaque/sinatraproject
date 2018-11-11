#!binbash
sudo apt update -y
sudo apt install ruby -y
sudo apt install nginx -y
sudo apt install git -y
sudo gem install sinatra --no-ri --no-rdoc
sudo apt  install ruby-bundler -y



# make change on nginx config to forward traffic


sudo vim /etc/nginx/sites-enabled/default 


location / {
    proxy_pass       http://localhost:4567;
    proxy_set_header Host      $host;
    proxy_set_header X-Real-IP $remote_addr;
}

sudo service nginx restart

mkdir sinatraproject
git clone https://github.com/rea-cruitment/simple-sinatra-app.git
cd simple-sinatra-app

bundle install
bundle exec rackup



