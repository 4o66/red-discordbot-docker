#!/bin/bash
docker build . -t 4o66/red-discordbot:$(grep -Po 'ENV VERSION="\K[^"]*' Dockerfile)
docker tag 4o66/red-discordbot:$(grep -Po 'ENV VERSION="\K[^"]*' Dockerfile) 4o66/red-discordbot:latest
