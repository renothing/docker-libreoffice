FROM openjdk:8-jre
LABEL role='libreoffice' version='0.0.1' tags='libreoffice,openoffice' description='libfreoffice conversion with jre8 support'
#set enviroments
ENV TIMEZONE="Asia/Shanghai" \
    VERSION=5.2.7
#install software
RUN apt-get update && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true |debconf-set-selections && \
    apt-get -y install locales-all fonts-wqy-microhei fonts-wqy-zenhei fontconfig libxt6 libxrender1 && \
#   wget --content-disposition http://download.documentfoundation.org/libreoffice/stable/${VERSION}/deb/x86_64/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz -O /srv/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz && \
#   tar xf /srv/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz -C /srv/ && \
#   rm -rf /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/libobasis5.2-gnome-integration* && \
#   rm -rf /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/libreoffice5.2-debian-menus* && \
#   rm -rf /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/libobasis5.2-kde-integration* && \
#   dpkg -i /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/*.deb && \
    apt-get -y install libreoffice --no-install-recommends --no-install-suggests && \
#Cleaning up
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo "${TIMEZONE}" > /etc/timezone && \
    echo "${TIMEZONE}" > /etc/timezone && \
    dpkg-reconfigure fontconfig && fc-cache -f -s -v && rm -rf /srv/* 
#forwarding port
#EXPOSE 8001
#VOLUME ["/usr/share/fonts/msfonts"]
#set default command
#ENTRYPOINT ["/usr/bin/soffice","--headless"]
#CMD ["--norestore","--accept='socket,host=0,port=8001,tcpNoDelay=1;urp;'"]
