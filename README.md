#Docker SabNZBD#
[![Build Status](https://jenkins.dray.be/buildStatus/icon?job=docker_sabnzbd)](https://jenkins.dray.be/job/docker_sabnzbd)

This is a docker image for SabNZBD running on an Alpine linux container

##Usage##
Sabnzbd will run on port 8080 by default (9090 if you choose SSL). (Use `-p 8080:8080` ).
Sabnzbd config will be read from /config. Bind this to your host or a docker volume to make configuration permanent.
