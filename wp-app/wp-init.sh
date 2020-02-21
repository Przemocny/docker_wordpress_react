#!/usr/bin/env bash

echo "START INIT SCRIPT"

apt-get update 
apt-get install -y sudo
apt-get install -y mariadb-client

echo "DONE UPDATE"

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

wp --info

wp core download --force --allow-root --skip-content
sudo mv config.yml ~/.wp-cli/config.yml
echo "DONE DOWNLOAD WP"

wp config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbhost=${WORDPRESS_DB_HOST} --dbpass=${WORDPRESS_DB_PASSWORD} 
echo "DONE CONFIG WP"

wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_NAME}  --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
wp cli update --stable --allow-root --yes
wp package install wp-cli/restful --allow-root

# wp rewrite flush --allow-root
wp option update --allow-root permalink_structure '/%postname%/' 
wp rewrite --allow-root structure --hard '/%postname%/'

echo "DONE INSTALL WP"
# wp theme activate redirect --allow-root

echo "DONE THEMING"

wp plugin install advanced-custom-fields-pro.zip --activate --allow-root --path=/var/www/html
# wp plugin install acf-to-rest-api --activate --allow-root
# wp plugin install wp-rest-cache --activate --allow-root
# wp plugin install wp-rest-api-v2-menus --activate --allow-root
wp plugin install contact-form-7 --activate --allow-root
# wp plugin install imagify --activate --allow-root
wp plugin install woocommerce --activate --allow-root
wp plugin install https://github.com/dotpay/WooCommerce2/archive/master.zip --activate --allow-root

wp plugin install https://github.com/wp-graphql/wp-graphql/archive/master.zip --activate --allow-root
wp plugin install https://github.com/wp-graphql/wp-graphiql/archive/master.zip --activate --allow-root
wp plugin install https://github.com/wp-graphql/wp-graphql-woocommerce/archive/master.zip --activate --allow-root
wp plugin install https://github.com/wp-graphql/wp-graphql-acf/archive/master.zip --activate --allow-root

echo "DONE PLUGINS"

echo "DONE WP"

exec apache2-foreground