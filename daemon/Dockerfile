FROM node:10-alpine as base

ARG daemon_ver
ENV DAEMON_VER ${daemon_ver}

ARG sftp_ver
ENV SFTP_VER ${sftp_ver}

# As this is the default location,
# configuration is much simplified
# if this is left alone.
WORKDIR /srv/daemon
RUN mkdir /srv/daemon-data

# Install dependencies
RUN apk add --no-cache make gcc g++ \
	python \
	tar zip unzip curl supervisor tini

# Download daemon
RUN curl -L https://github.com/pterodactyl/daemon/releases/download/${DAEMON_VER}/daemon.tar.gz | tar --strip-components=1 -xzv

# Download sftp server
RUN curl -Lo sftp-server https://github.com/pterodactyl/sftp-server/releases/download/${SFTP_VER}/sftp-server \
	chmod +x sftp-server

# Copy supervisord conf and entrypoint
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Entrypoint and command
ENTRYPOINT [ "/sbin/tini", "/entrypoint.sh" ]
CMD [ "supervisord", "-n", "-c", "/etc/supervisord.conf" ]
