FROM ubuntu:14.04
MAINTAINER Juan Jose Amor <jjamorNOSPAM@gmail.com>

ADD http://nginx.org/keys/nginx_signing.key /root/
RUN apt-key add /root/nginx_signing.key
ADD nginx.list /etc/apt/sources.list.d/
ADD http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb /root/
RUN dpkg -i /root/erlang-solutions_1.0_all.deb && apt-get update
RUN apt-get install -y ca-certificates-java default-jre-headless emacsen-common fontconfig \
  build-essential git git-flow \
  fontconfig-config fonts-dejavu-core hicolor-icon-theme icedtea-7-jre-jamvm \
  java-common libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data \
  libavahi-common3 libcairo2 libcups2 libdatrie1 libdrm-intel1 libdrm-nouveau2 \
  libdrm-radeon1 libfontconfig1 libfontenc1 libgdk-pixbuf2.0-0 \
  libgdk-pixbuf2.0-common libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa \
  libglu1-mesa libgraphite2-3 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common \
  libharfbuzz0b libice6 libjasper1 libjbig0 libjpeg-turbo8 libjpeg8 liblcms2-2 \
  libllvm3.4 libltdl7 libnspr4 libnss3 libnss3-1d libnss3-nssdb libodbc1 \
  libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpciaccess0 \
  libpixman-1-0 libsctp1 libsm6 libtcl8.6 libthai-data libthai0 libtiff5 \
  libtk8.6 libtxc-dxtn-s2tc0 libutempter0 libwxbase2.8-0 libwxgtk2.8-0 \
  libx11-xcb1 libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 \
  libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcomposite1 \
  libxcursor1 libxdamage1 libxfixes3 libxft2 libxi6 libxinerama1 libxmu6 \
  libxpm4 libxrandr2 libxrender1 libxshmfence1 libxss1 libxt6 libxtst6 libxv1 \
  libxxf86dga1 libxxf86vm1 lksctp-tools openjdk-7-jre-headless tcl tcl8.6 tk \
  tk8.6 tzdata-java x11-common x11-utils xbitmaps xterm \
  postfix opendkim-tools opendkim nginx bundler ruby-childprocess ruby curl \
  ruby-erubis ruby-ffi ruby-i18n ruby-log4r ruby-net-scp ruby-net-ssh ruby1.9.1
RUN apt-get install -y esl-erlang=1:17.1 && apt-mark hold esl-erlang erlang-mode
# Limits: Try to establish open file limits required for project users.
# This is effective only if you run image with "docker run --privileged=true"
RUN echo "* soft nofile 70000" >> /etc/security/limits.conf && \
echo "* hard nofile 100000" >> /etc/security/limits.conf && \
echo "session required pam_limits.so" >> /etc/pam.d/common-session && \
echo "session required pam_limits.so" >> /etc/pam.d/common-session-noninteractive && \
echo "fs.file-max = 379284" >> /etc/sysctl.conf
