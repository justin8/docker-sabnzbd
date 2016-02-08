FROM justin8/python
MAINTAINER justin@dray.be

RUN apk add --update unzip unrar sqlite
RUN pip install cheetah

RUN wget -O par2cmdline.tar.gz https://github.com/Parchive/par2cmdline/archive/v0.6.13.tar.gz && \
    tar zxf par2cmdline.tar.gz && \
    rm par2cmdline.tar.gz && \
    mv par2cmdline* par2cmdline
RUN wget -O yenc.tar.gz http://bitbucket.org/dual75/yenc/get/0.4.0.tar.gz && \
    tar zxf yenc.tar.gz && \
    rm yenc.tar.gz && \
    mv *yenc* yenc && \
    echo '---------------------' && \
    apk add alpine-sdk automake autoconf python-dev && \
    cd /par2cmdline && \
    aclocal && \
    automake --add-missing && \
    autoconf && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd /yenc && \
    python setup.py build && \
    python setup.py install --optimize=1 && \
    apk del alpine-sdk automake autoconf python-dev && \
    echo '---------------------' && \
    rm -rf /par2cmdline /yenc

ENV version 0.7.20
RUN echo $version > /version
RUN wget -O sabnzbd.tar.gz https://github.com/sabnzbd/sabnzbd/archive/$version.tar.gz && \
    tar zxf sabnzbd.tar.gz && \
    rm sabnzbd.tar.gz && \
    mv sabnzbd* sabnzbd

COPY entrypoint.sh /

VOLUME "/config"

EXPOSE 8080 9090
CMD /entrypoint.sh
