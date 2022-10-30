# Dockerfile for Samba (without netbios)
# - using alpine as base

FROM alpine

# Update package manager and install Samba
RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update samba-common-tools samba-client samba-server \
        bash coreutils jq shadow tzdata yq

# Create Environment Variables
#ENV USER=samba-user
#ENV UID=1001
#ENV GID=1001
#ENV GROUP=sambashare

#==============#
# Create Users #
#==============#
# Add user management script temporarily into container (filename: user_mgmt.sh)
COPY ./user_mgmt.sh /user_mgmt.sh

# Execute script in container
RUN bash /user_mgmt.sh

# Remove script
RUN rm /user_mgmt.sh

#===============#
# Samba Configs #
#===============#
# Copy Samba configurations
COPY samba/config/smb.conf /etc/samba/smb.conf

#================#
# Docker Configs #
#================#
# Export port 139 (TCP)
EXPOSE 139/tcp

# Expose port 445 (TCP) for Samba
EXPOSE 445/tcp

# Mount Volumes
# VOLUME ["$PWD/samba/config/smb.conf"]

# Start container with this command
# ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
# CMD ["service", "smbd", "start"]
CMD ["smbd", "--foreground", "--no-process-group"]
