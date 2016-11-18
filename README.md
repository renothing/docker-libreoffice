# docker-libreoffice
libfreoffice conversion with jre8 support
This repository contains **Dockerfile** of [Libreoffice](http://www.libreoffice.org/) for [Docker](https://www.docker.com/)'s automated build.

### Base Docker Image

* [openjdk:jre8](https://hub.docker.com/_/openjdk/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/renothing/libreoffice/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull renothing/libreoffice`

   (alternatively, you can build an image from Dockerfile: `docker build -t="renothing/libreoffice:tag" github.com/renothing/docker-libreoffice`)
   additional fonts would be added by volume mounting, for example：

### Usage

    docker run -dit --name libreoffice -v yourfontsvolumepath:/usr/share/fonts/msfonts renothing/libreoffice

