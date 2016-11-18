# docker-libreoffice
This is a dockerized LibreOffice packaged as a headess service with jre8 support.  
This repository contains **Dockerfile** of [Libreoffice](http://www.libreoffice.org/) for [Docker](https://www.docker.com/)'s automated build.

### Base Docker Image

* [openjdk:jre8](https://hub.docker.com/_/openjdk/)
* [openjdk:jre8-alpine](https://hub.docker.com/_/openjdk/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/renothing/libreoffice/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull renothing/libreoffice`

   (alternatively, you can build an image from Dockerfile: `docker build -t="renothing/libreoffice:tag" http://github.com/renothing/docker-libreoffice`)
   additional fonts would be added by volume mounting, for example:  
   docker run -dit --name libreoffice -v yourfontsvolumepath:/usr/share/fonts/msfonts renothing/libreoffice

### Usage

    docker run -dit --name libreoffice -v yourfontsvolumepath:/usr/share/fonts/msfonts renothing/libreoffice  
    #run in headless service mode and listen on port 8001:
    docker run -dit --name libreoffice --entrypoint /usr/bin/soffice renothing/libreoffice:alpine --headless --norestore --accept='socket,host=0,port=8001,tcpNoDelay=1;urp;'
