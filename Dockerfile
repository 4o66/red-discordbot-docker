FROM python:3.8.2

RUN apt update && \
	apt -y install \
		make \
		build-essential \
		libssl-dev \
		zlib1g-dev \
		libbz2-dev \
		libreadline-dev \
		libsqlite3-dev \
		wget \
		curl \
		llvm \
		libncurses5-dev \
		xz-utils \
		tk-dev \
		libxml2-dev \
		libxmlsec1-dev \
		libffi-dev \
		liblzma-dev \
		libgdbm-dev \
		uuid-dev \
		python3-openssl \
		git \
		openjdk-11-jre \
		jq \
	--no-install-recommends && rm -r /var/lib/apt/lists/*
	
ENV CXX /usr/bin/g++

RUN command -v pyenv && pyenv update || curl https://pyenv.run | bash

ENV PATH="/root/.pyenv/bin:${PATH}"

RUN CONFIGURE_OPTS=--enable-optimizations pyenv install 3.8.2 -v && pyenv global 3.8.2

RUN apt -y remove make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libgdbm-dev uuid-dev && apt -y autoremove

RUN pyenv virtualenv red_env && eval "$(pyenv init -)" && pyenv global red_env

RUN python -m pip install -U pip setuptools wheel

RUN python -m pip install -U Red-DiscordBot[postgres]

#When I was testing is was very useful to have nano inside the image
#RUN apt update && apt -y install nano --no-install-recommends && rm -r /var/lib/apt/lists/*

ENV VERSION="0.3.1"

#Moving to github, so no longer using a tar.gz
#ADD redbot_config.tar.gz /root/.local/share

#Build folders found after a manual install
RUN mkdir -p /root/.config/Red-DiscordBot  &&  mkdir -p /root/.local/share/Red-DiscordBot/data/redbot/cogs/CogManager && mkdir -p /root/.local/share/Red-DiscordBot/data/redbot/cogs/Bank && mkdir -p /root/.local/share/Red-DiscordBot/data/redbot/cogs/Downloader/lib && mkdir -p /root/.local/share/Red-DiscordBot/data/redbot/cogs/ModLog && mkdir -p /root/.local/share/Red-DiscordBot/data/redbot/core/logs

#Create the empty config files created by a manual install
RUN echo {} > /root/.local/share/Red-DiscordBot/data/redbot/cogs/CogManager/settings.json && echo {} > /root/.local/share/Red-DiscordBot/data/redbot/cogs/Bank/settings.json && echo {} > /root/.local/share/Red-DiscordBot/data/redbot/cogs/ModLog/settings.json

#copy the Instance config file
COPY configs/config.json /root/.config/Red-DiscordBot/

#Copy the default bot settings
COPY configs/settings.json /root/.local/share/Red-DiscordBot/data/redbot/core/

#Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/

#Create the Token environment variable so if the user uses a controller like Portainer, they can easily modify the container
ENV TOKEN=null

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/docker-entrypoint.sh"]

CMD ["redbot"]

