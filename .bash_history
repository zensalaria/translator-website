sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo apt install php-fpm -y
sudo systemctl start php7.4-fpm
sudo systemctl enable php7.4-fpm
sudo systemctl start php8.1-fpm
sudo systemctl enable php8.1-fpm
sudo systemctl status php8.1-fpm
sudo nano /etc/nginx/sites-available/default
docker ps
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
docker --version
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
dls
ls
pwd
scp -i language_translation.pem -r Coding/language_translation_site ubuntu@13.61.56.170:/home/ubuntu/
scp -i /Users/zen/Coding/pem_keys/language_translation.pem -r /Users/zen/Coding/language_translation_site ubuntu@13.61.56.170:/home/ubuntu/
ls /Users/zen/Coding/pem_keys/
exit
ssh -i /Users/zen/Coding/pem_keys/language_translation.pem ubuntu@13.61.56.170
pwd
ls
sudo rm -rf language_translation_site
ls
docker ps
sudo systemctl status docker
sudo docker ps
ls
exit
nginx -v
php -v
exit
sudo cp /home/ubuntu/nginx.conf /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo nginx -t
sudo docker ps
sudo docker-compose up -d
exit
cd /home/ubuntu/
sudo docker-compose up -d
exit
cd /home/ubuntu
sudo docker-compose up -d --build
exit
cd /home/ubuntu
sudo docker-compose up -d --build
exit
pwd
ls
ls /home/ubuntu/flask-api
cat /home/ubuntu/docker-compose.yml
sudo docker-compose up -d --build
cat /home/ubuntu/flask-api/Dockerfile
exit
cd /home/ubuntu
sudo docker-compose up -d --build
docker ps
sudo docker ps
sudo docker start ubuntu-web-1
sudo docker ps
curl http://localhost:8080
sudo docker logs ubuntu-web-1
exit
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker stop ubuntu-web-1
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker rm ubuntu-web-1
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker-compose up -d web
sudo docker ps
exit
curl http://localhost:8080
sudo docker exec -it ubuntu-web-1 cat /etc/nginx/conf.d/default.conf
pwd
ls
cd ww
sudo cd ww
ls
ubuntu@ip-172-31-42-200:~$ ls
docker-compose.yml  flask-api  nginx.conf  www
ubuntu@ip-172-31-42-200:~$ cd ww
-bash: cd: ww: No such file or directory
ubuntu@ip-172-31-42-200:~$ sudo cd ww
sudo: cd: command not found
sudo: "cd" is a shell built-in command, it cannot be run directly.
sudo: the -s option may be used to run a privileged shell.
sudo: the -D option may be used to run a command in a specific directory.
ubuntu@ip-172-31-42-200:~$ ls
docker-compose.yml  flask-api  nginx.conf  www
ubuntu@ip-172-31-42-200:~$ 
ls /home/ubuntu/www
cat /home/ubuntu/docker-compose.yml
cat /home/ubuntu/nginx.conf
nano /home/ubuntu/nginx.conf
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d --build
curl http://localhost:8080
nano /home/ubuntu/nginx.conf
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d --build
curl http://localhost:8080
exit
sudo docker logs ubuntu-web-1
sudo ufw status
sudo iptables -L -n
sudo docker inspect ubuntu-web-1 | grep '"8080"'
sudo docker inspect ubuntu-web-1 | grep -A 5 '"Ports"'
exit
13.61.56.170
nano /home/ubuntu/nginx.conf
cd /home/ubuntu
sudo docker-compose restart web
exit
sudo docker logs ubuntu-web-1
curl -v http://localhost:8080
curl -v http://whotranslates.com
exit
sudo docker logs ubuntu-web-1
curl http://localhost:8080
curl http://whotranslates.com
nslookup whotranslates.com
dig whotranslates.com
sudo docker ps
curl http://localhost:8080
curl http://13.61.56.170:8080
sudo docker logs ubuntu-web-1
nslookup whotranslates.com
curl -v http://whotranslates.com
sudo docker exec -it ubuntu-web-1 cat /var/log/nginx/error.log
pwd
sudo docker exec -it ubuntu-web-1 cat /var/log/nginx/error.log
exit
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker stop ubuntu-web-1
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker ps
sudo docker rm ubuntu-web-1
sudo docker-compose up -d web
sudo docker ps
sudo docker ps -a
sudo docker logs ubuntu-web-1
exit
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker stop ubuntu-web-1
sudo docker cp /home/ubuntu/nginx.conf ubuntu-web-1:/etc/nginx/conf.d/default.conf
sudo docker rm ubuntu-web-1
sudo docker-compose up -d web
sudo docker logs ubuntu-web-1
sudo nano /home/ubuntu/nginx.conf
sudo docker stop ubuntu-web-1
sudo docker rm ubuntu-web-1
sudo docker-compose up -d web
sudo docker logs ubuntu-web-1
curl http://localhost:8080
exit
sudo netstat -tuln | grep :80
sudo ss -tuln | grep :80
exit
sudo mv /home/ubuntu/docker-compose.yml /home/ubuntu/docker-compose.yml.bak  # Backup current file
sudo mv /home/ubuntu/docker-compose.yml /path/to/actual/location/if/not/home/ubuntu
ls
pwd
sudo mv /home/ubuntu/docker-compose.yml.bak /home/ubuntu/docker-compose.yml
sudo mv /home/ubuntu/docker-compose.yml /home/ubuntu/docker-compose.yml
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d
sudo docker ps
sudo ss -tuln | grep :80
curl http://localhost
curl http://13.61.56.170
nslookup whotranslates.com
dig whotranslates.com
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
sudo systemd-resolve --flush-caches
exit
sudo systemd-resolve --flush-caches
sudo resolvectl flush-caches
resolvectl status
sudo docker ps
exit
sudo docker logs ubuntu-web-1
exit
sudo docker-compose down
sudo docker-compose up -d
curl -v http://whotranslates.com
sudo nano /etc/hosts
pwd
sudo apt update
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d whotranslates.com -d www.whotranslates.com
sudo nano /etc/nginx/sites-enabled/default
sudo nginx -t
sudo docker ps
docker network inspect ubuntu_app-network
sudo usermod -aG docker $USER
docker ps
exit
docker ps
docker network inspect ubuntu_app-network
sudo nano /etc/nginx/sites-enabled/default
sudo nginx -t
sudo docker network inspect ubuntu_app-network
sudo nano /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx.service
sudo journalctl -xeu nginx.service
sudo lsof -i :80
sudo docker ps
sudo docker stop ubuntu-web-1
sudo systemctl restart nginx
sudo docker-compose up -d
sudo docker ps | grep nginx
sudo systemctl stop nginx
sudo systemctl disable nginx
sudo lsof -i :80
sudo docker-compose up -d
sudo docker ps | grep nginx
curl http://whotranslates.com
sudo apt update
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d whotranslates.com -d www.whotranslates.com
sudo systemctl stop nginx
sudo systemctl disable nginx
sudo systemctl status nginx
sudo docker start ubuntu-web-1
sudo certbot certonly --webroot -w /path/to/your/webroot -d whotranslates.com -d www.whotranslates.com
sudo certbot certonly --webroot -w /var/www/html -d whotranslates.com -d www.whotranslates.com
ls

sudo docker inspect ubuntu-web-1
sudo certbot certonly --webroot -w /home/ubuntu/www -d whotranslates.com -d www.whotranslates.com
sudo nano /etc/ngi
sudo nginx -t
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo docker network ls
sudo docker ps
sudo docker network inspect ubuntu_app-network
sudo docker exec -it ubuntu-web-1 bash
sudo docker exec -it ubuntu-php-1 bash
sudo docker logs ubuntu-php-1
sudo nano /etc/nginx/sites-enabled/default
sudo docker exec -it ubuntu-web-1 nginx -t
sudo docker exec -it ubuntu-web-1 nginx -s reload
echo "<?php phpinfo(); ?>" | sudo tee /home/ubuntu/www/info.php
sudo docker exec -it ubuntu-web-1 ls -l /home/ubuntu/www
pwd
ls
sudo nano /home/ubuntu/docker-compose.yml
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
sudo cp /home/ubuntu/docker-compose.yml /home/ubuntu/docker-compose.yml.bak
sudo nano /home/ubuntu/docker-compose.yml
ls /home/ubuntu/www
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
sudo nano /home/ubuntu/docker-compose.yml
sudo docker ps -a
sudo docker logs ubuntu-web-1
sudo nano /home/ubuntu/nginx.conf
sudo cp /home/ubuntu/nginx.conf /home/ubuntu/nginx.conf.bak
sudo nano /home/ubuntu/docker-compose.yml
sudo nano /home/ubuntu/nginx_server.conf
ls -l /home/ubuntu/www
sudo chown -R 1000:1000 /home/ubuntu/www
sudo chmod -R 755 /home/ubuntu/www
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
sudo nano /home/ubuntu/docker-compose.yml
sudo nano /home/ubuntu/default.conf
ls -l /home/ubuntu/www
sudo chown -R 1000:1000 /home/ubuntu/www
sudo chmod -R 755 /home/ubuntu/www
ls -l /home/ubuntu/certs/live/whotranslates.com/
sudo nano /home/ubuntu/docker-compose.yml
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
sudo docker-compose ps -a
sudo docker logs ubuntu-web-1
sudo nano /home/ubuntu/default.conf
sudo nano /home/ubuntu/docker-compose.yml
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
cat /home/ubuntu/default.conf
cat /home/ubuntu/docker-compose.yml
sudo docker-compose ps
sudo docker logs ubuntu-web-1
sudo nano /home/ubuntu/docker-compose.yml
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
sudo docker logs ubuntu-web-1
sudo docker exec -it ubuntu-web-1 cat /etc/nginx/conf.d/default.conf
nslookup whotranslates.com
sudo apt update
sudo apt install snapd
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot certificates
cat /home/ubuntu/default.conf
# HTTP Server Block
server {
}
# HTTPS Server Block
server {

sudo nano /home/ubuntu/default.conf
sudo nano /home/ubuntu/docker-compose.yml
cd /home/ubuntu
sudo docker-compose down
sudo docker-compose up -d
sudo docker-compose ps
sudo docker-compose ps -a
sudo docker logs ubuntu-web-1
sudo nano /home/ubuntu/docker-compose.yml
sudo nano /home/ubuntu/default.conf
ls -l /home/ubuntu/certs/live/whotranslates.com/
sudo mkdir -p /home/ubuntu/certs/live/whotranslates.com
sudo mkdir -p /home/ubuntu/certs/archive/whotranslates.com
sudo mkdir -p /home/ubuntu/certs/logs
sudo chown -R $USER:$USER /home/ubuntu/certs
sudo apt update
sudo apt install snapd
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -sf /snap/bin/certbot /usr/bin/certbot
exit
