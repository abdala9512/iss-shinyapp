FROM rocker/shiny-verse:latest

RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    lbzip2 \
  && install2.r --error --deps TRUE \
    leaflet