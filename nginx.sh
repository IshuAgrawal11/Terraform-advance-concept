#!/bin/bash

sudo apt-get update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginnx
echo "<h1> Terraform ke through nginx install ho gaya </h1>" | sudo tee /var/www/html/index.html