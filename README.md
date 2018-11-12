# SinatraProject
This project created to deploy the Sinatra "Hello World!" app. I have clone the provided repository (https://github.com/rea-cruitment/simple-sinatra-app) then added following 3 files - 

1. sinatraproject.json 

This file contains cloud formation template to deploy a Security Group which only allow traffic on port 80 and 22. It also launches an EC2 Instance with Ubuntu Server 18.04 LTS Image


2. startup.sh 

This file also saved on my s3 bucket which have public access (https://s3-ap-southeast-2.amazonaws.com/zahurul.info/startup.sh). The sinatraproject.json template stated above apply this bash file when the EC2 Starts up. This script contains bash command to install all the prerequisite for the app deployment. It also install Nginx service as proxy for additional security. This bash script clone this repository then replace the nginx config on /etc/nginx/sites-enabled/ with the default file stated below, so nginx listen port 80 then forward web traffic to Sinatra 9292

3. default

This file replaces default Nginx config file. It have a configuration to listen on port 80 then forward on to port 9292.


Deployment
==========
Prerequisite : Please note "sinatraproject.json" have Keyname called "MyWebServerSyd", Which needed to be replaced by your own key, can be used for ssh access to the ec2 instance.


Here are the steps to deploy this app by AWS Cloud Formation

1. On AWS Console, please go to cloud formation, choose to create a stack by uploading a template
2. Use sinatraproject.json template file to be uploaded and create stack, Please follow the deafult setting, Also need to provide a name for the stack
3. It will take 3-4 minutes to create the stack (Security Group and the EC2) + apply the bash script on the start up.
4. Now please go to EC2 service page to find the public IP address
5. Open a web browser and go to the ip address, it should be showing the Hello World! app.

Security
========
- Sinatra not exposed to the web rather accepting traffic from nginx
- We have only allowed port 80 for html and port 22 for ssh to minimize risk

Advanced Deployment
===================
This Deployent can be done from gitHub directly using Jenkin server to AWS Cloud formation for CI/CD. So we dont have to manually create the stack.


