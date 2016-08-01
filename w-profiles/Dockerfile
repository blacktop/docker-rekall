FROM blacktop/yara:3.4

MAINTAINER blacktop, https://github.com/blacktop

# Install Rekall Dependancies
RUN apk-install ca-certificates py-setuptools bash
RUN apk-install -t build-deps py-pip \
                              build-base \
                              python-dev \
                              ncurses-dev \
                              readline-dev \
  && set -x \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel setuptools \
  && echo "Installing Rekall..." \
  && LDFLAGS=-L/lib pip install --pre rekall \
  && echo "Installing rekall-profiles..." \
  && git clone --depth 1 https://github.com/google/rekall-profiles.git \  
  && rm -rf /tmp/* /root/.cache /var/cache/apk/* /var/tmp/* \
  && apk del --purge build-deps

COPY rekallrc /root/.rekallrc

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["gosu","nobody","/sbin/tini","--","rekall"]

CMD ["-h"]
