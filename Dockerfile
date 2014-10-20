FROM justin8/archlinux
MAINTAINER justin@dray.be

RUN pacman -Syq --noprogressbar --noconfirm sabnzbd python2-pyopenssl && rm -rf /var/cache/pacman/pkg/*

VOLUME "/config"

EXPOSE 8080 9090
CMD /opt/sabnzbd/SABnzbd.py -f /config
