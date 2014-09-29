FROM justin8/archlinux
MAINTAINER justin@dray.be

RUN pacman -Syq --noprogressbar --noconfirm sabnzbd

VOLUME "/config"

EXPOSE 8080 9090
CMD /opt/sabnzbd/SABnzbd.py -f /config
