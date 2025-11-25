sudo apt update
sudo apt install nginx
systemctl status nginx
sudo mkdir -p /var/www/example.test/html
cd /var/www/example.test/html
sudo git clone https://github.com/cloudacademy/static-website-example
