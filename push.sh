#!/bin/bash
docker push 4o66/red-discordbot:$(grep -Po 'ENV VERSION="\K[^"]*' Dockerfile)
docker push 4o66/red-discordbot:latest
