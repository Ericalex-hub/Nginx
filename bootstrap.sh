sudo apt update
sudo apt install nginx
systemctl status nginx
sudo mkdir -p /var/www/example.test/html
cd /var/www/example.test/html
sudo git clone https://github.com/cloudacademy/static-website-example
sudo chown -R www-data:www-data /var/www/example.test/html
sudo chmod -R 755 /var/www/example.test
sudo nano /etc/nginx/sites-available/example.test
sudo ln -s /etc/nginx/sites-available/example.test /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo nano /etc/nginx/sites-available/example.test
#----------EMPIEZA LA SEGUNDA PARTE DE ESTA PRÁCTICA----------
dpkg -l | grep openssl