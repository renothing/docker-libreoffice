FROM openjdk:8-jre
LABEL role='libreoffice' version='0.0.1' tags='libreoffice,openoffice' description='libfreoffice conversion with jre8 support'
#install software
ENV VERSION=5.2.3
RUN apt-get update && \
 echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true |debconf-set-selections && \
 apt-get -y install ttf-mscorefonts-installer fonts-wqy-microhei fonts-wqy-zenhei fontconfig libxt6 libxrender1 && \
 wget --content-disposition http://download.documentfoundation.org/libreoffice/stable/${VERSION}/deb/x86_64/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz -O /srv/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz && \
 tar xf /srv/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz -C /srv/ && \
 rm -rf /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/libobasis5.2-gnome-integration* && \
 rm -rf /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/libreoffice5.2-debian-menus* && \
 rm -rf /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/libobasis5.2-kde-integration* && \
 dpkg -i /srv/srv/LibreOffice_${VERSION}_Linux_x86-64_deb/DEBS/*.deb && \
 rm -rf  /etc/fonts/conf.d/70-no-bitmaps.conf && ln -s  /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/ \
 dpkg-reconfigure fontconfig && fc-cache -f -s -v && rm -rf /srv/* \
#forwarding port
#EXPOSE port
#VOLUME ["/usr/share/fonts/msfonts"]
#set default command
