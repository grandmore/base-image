# Base
#
# VERSION               0.0.1

FROM ubuntu
MAINTAINER Stuart Fenton "stuart@overlima.com"

# Tell dpkg not to ask questions
ENV DEBIAN_FRONTEND noninteractive

# This forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# We don't need an apt cache in a container
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

 # Make sure the package repository is up to date
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
#RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list

RUN apt-get update && apt-get -qy install eatmydata language-pack-en # 11/09/2013

#RUN eatmydata -- apt-get upgrade -yq 
RUN eatmydata -- apt-get install -yq build-essential

#fixes
RUN eatmydata apt-get -f install

# Fix locale
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Add init scripts
ADD init /init
