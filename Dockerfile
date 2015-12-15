FROM ubuntu:14.04
MAINTAINER Dennis Schridde <devurandom@gmx.net>

VOLUME /home

RUN apt-get -y install software-properties-common && apt-add-repository multiverse

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true | debconf-set-selections

RUN apt-get update && apt-get -y install --install-recommends firefox flashplugin-installer dbus-x11 pulseaudio gstreamer1.0-pulseaudio gstreamer1.0-plugins-good ubuntu-restricted-extras
COPY VMware-ClientIntegrationPlugin-5.5.0.x86_64.bundle /tmp/
RUN yes yes | sh -c 'PAGER=/bin/cat sh /tmp/VMware-ClientIntegrationPlugin-5.5.0.x86_64.bundle --console --required'
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]


