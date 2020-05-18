#!/bin/bash

docker volume rm -f redbot_test
docker run -it --rm --name redbot_test \
   -e TOKEN='MTUyODM4ODA0NzU0MDA2MDE2.Cgh7mg._HXoXgq9TmYAPiBnd6TdrZdyN9Y' \
   -v redbot_test:/root/.local/share/ 4o66/red-discordbot:$(grep -Po 'ENV VERSION="\K[^"]*' Dockerfile)

