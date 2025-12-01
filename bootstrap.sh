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
#----------AQUI EMPIEZA LA AUTENTICACIÓN DE NGINX----------
dpkg -l | grep openssl
sudo sh -c "echo -n 'vuestro_nombre:' >> /etc/nginx/.htpasswd"
sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
sudo sh -c "openssl passwd -apr1 'tu_contraseña' >> /etc/nginx/.htpasswd"
sudo adduser eric
sudo adduser aldana
cat /etc/nginx/.htpasswd
sudo nano /etc/nginx/sites-available/example_web