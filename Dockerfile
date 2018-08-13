FROM consol/ubuntu-xfce-vnc

ARG PTD_VERSION=${PTD_VERSION:-1.11.1}
ENV PTD_VERSION ${PTD_VERSION}

WORKDIR /opt

USER root
RUN apt-get update && apt-get install -y \
    curl \
    gdebi-core

RUN curl -SL https://dl.ptdefender.com/${PTD_VERSION}/PTDefender_${PTD_VERSION}_amd64.deb -o ptdefender.deb

RUN gdebi -n ptdefender.deb \
      && apt-get -f install \
      && dpkg -i ptdefender.deb \
      && rm ptdefender.deb \
      && apt-get -y autoremove

EXPOSE 6901
