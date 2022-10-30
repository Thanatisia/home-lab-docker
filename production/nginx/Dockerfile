#====================================
# Dockerfile for Nginx reverse proxy
#====================================

# Pull latest image
FROM nginx

# [Copy files into container]

# Host file
COPY ./etc/hosts /etc/hosts

# Default configuratio for the proxy service
COPY ./default.conf /etc/nginx/conf.d/default.conf

# HTML Error response page (i.e. 404)
COPY ./backend-not-found.html /var/www/html/backend-not-found.html

# Nginx includes proxy configurations
COPY ./includes/ /etc/nginx/includes/

# SSL certificates and keys
COPY ./ssl/ /etc/ssl/certs/nginx/



