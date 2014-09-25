FROM base/archlinux
MAINTAINER justin@dray.be

RUN curl -sO https://repo.dray.be/dray-repo-0.7-1-any.pkg.tar.xz
RUN pacman -U --noconfirm dray-repo-0.7-1-any.pkg.tar.xz
RUN pacman -Syq --noprogressbar --noconfirm sabnzbd

VOLUME "/config"

EXPOSE 8080 9090
CMD /opt/sabnzbd/SABnzbd.py -f /config
