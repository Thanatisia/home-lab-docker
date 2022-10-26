# Dockerfile for Samba (without netbios)
# - using debian (because smb.conf is preconfigured)

FROM debian

# Update package manager and install Samba
RUN apt update -y && \
    apt upgrade -y && \
    apt install samba -y

# Create Environment Variables
ENV USER=samba-user
ENV UID=1001
ENV GID=1001
ENV GROUP=sambashare

# Create Group
# RUN addgroup --gid ${GID} ${USER}

RUN groups

# Create User
#RUN adduser \
#    --disabled-password \
#    --gecos "" \
#    --home "$(pwd)" \
#    --ingroup "$GROUP" \
#    --no-create-home \
#    --uid "$UID" \
#    "$USER"

# Add Password file temporarily to container (filename: .pw)
ADD .pw /

# Read .pw file to set password to container user password
RUN (cat /.pw; cat /.pw) | passwd ${USER}

# Read .pw file to set password to container samba password
RUN (cat /.pw; cat /.pw) | smbpasswd -a ${USER}

# Remove Password file
RUN rm .pw

# Expose port 445 (TCP) for Samba
EXPOSE 445/tcp

# Mount Volumes
# VOLUME ["$PWD/samba/config/smb.conf"]

# Start container with this command
# ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
CMD ["service", "smbd", "start"]

