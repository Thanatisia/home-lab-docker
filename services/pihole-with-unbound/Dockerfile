# Get a base system image to build your image from
FROM pihole/pihole:latest

# Expose this port to port forward when running the container
# EXPOSE 80

# Update and Upgrade package manager
RUN apt update -yqq && apt upgrade -yqq

# Install unbound
RUN apt install -yqq unbound


