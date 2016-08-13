FROM blacktop/yara:3.5

MAINTAINER blacktop, https://github.com/blacktop

ENV REKALL_VERSION 1.5.3

# Install Rekall Dependancies
RUN apk-install py-setuptools bash
RUN apk-install -t .build-deps \
                    unzip \
                    py-pip \
                    build-base \
                    python-dev \
                    ncurses-dev \
                    readline-dev \
                    linux-headers \
                    ca-certificates \
  && set -x \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel setuptools \
  && echo "Installing Rekall..." \
  && LDFLAGS=-L/lib pip install https://github.com/google/rekall/archive/$REKALL_VERSION.zip \
  && echo "Installing Rekall GUI..." \
  && pip install rekall-gui \
  && echo "Installing rekall-profiles..." \
  && cd /tmp \
  && wget https://github.com/google/rekall-profiles/archive/gh-pages.zip \
  && unzip gh-pages.zip \
  && cd rekall-profiles-gh-pages \
  && mv v1.0 /rekall-profiles \
  && rm -rf /tmp/* /root/.cache /var/cache/apk/* /var/tmp/* \
  && apk del --purge .build-deps

COPY rekallrc /root/.rekallrc

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["gosu","nobody","/sbin/tini","--","rekall"]

CMD ["-h"]
