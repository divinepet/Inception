#!/bin/bash

if ! $(wp core is-installed --allow-root); then
	wp config shuffle-salts --allow-root
    wp core install		\
        --allow-root    \
	--path=/var/www/wordpress	\
        --url=${WP_SITE_URL}        \
        --title=${WP_SITE_TITLE}    \
        --admin_user=${WP_ADMIN_USER}     \
        --admin_password=${WP_ADMIN_PASS} \
        --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user_pass=${WP_USER_PASS}
fi

exec "$@"
