FROM debian:jessie-slim

# homedir
ENV HOME /root

# workdir
WORKDIR /root

RUN apt-get update && apt-get install -y \
	bluetooth \
	bluez \
	libbluetooth-dev \
	libudev-dev \
	libusb-1.0-0-dev \
	git \
	curl \
	build-essential \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/mKeRix/room-assistant.git \
	&& cd room-assistant \
	&& npm install
	# && npm install -g forever forever-service \
	# && forever-service install -s index.js -e "ENV=prod" --start room-assistant

WORKDIR /root/room-assistant

CMD ["npm", "start"]