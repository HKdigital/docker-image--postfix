
# ........................................................................ About
#
# @see README at https://github.com/HKdigital/docker-image--rendertron
#
#
# Based on https://github.com/danil-smirnov/docker-postfix
# (which is based on https://hub.docker.com/r/catatnight/postfix)
#

# ......................................................................... FROM

FROM hkdigital/debian-slim

MAINTAINER Jens Kleinhout "hello@hkdigital.nl"

# .......................................................................... ENV

# Update the timestamp below to force an apt-get update during build
ENV APT_SOURCES_REFRESHED_AT 2022-10-06_09h36

# ................................................................... Rendertron

# @see https://github.com/dockette/rendertron/blob/master/rendertron/Dockerfile

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y supervisor postfix sasl2-bin opendkim opendkim-tools \
                   iptables fail2ban cron rsyslog \
    && rm -rf /var/lib/apt/lists/*


# ............................................................ COPY /image-files

# Copy files and folders from project folder "/image-files" into the image
# - The folder structure will be maintained by COPY
#
# @note
#    No star in COPY command to keep directory structure
#    @see http://stackoverflow.com/
#        questions/30215830/dockerfile-copy-keep-subdirectory-structure

# Update the timestamp below to force copy of image-files during build
ENV IMAGE_FILES_REFRESHED_AT 2022-10-06_09h36

COPY ./image-files/ /

# ................................................................. EXPOSE PORTS

# @note the expose command does not publish the ports (documentation only)
EXPOSE 25
EXPOSE 587
