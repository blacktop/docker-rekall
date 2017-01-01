FROM blacktop/yara:3.5

MAINTAINER blacktop, https://github.com/blacktop

ENV REKALL_VERSION 1.6.0

# Install Rekall Dependancies
RUN apk-install py-setuptools py-cffi bash
RUN apk-install -t .build-deps \
                    py-pip \
                    build-base \
                    python-dev \
                    ncurses-dev \
                    openssl-dev \
                    readline-dev \
                    linux-headers \
                    ca-certificates \
  && set -x \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel setuptools \
  && echo "===> Installing Rekall..." \
  && LDFLAGS=-L/lib pip install rekall==$REKALL_VERSION rekall-agent==$REKALL_VERSION \
  && rm -rf /tmp/* /root/.cache /var/cache/apk/* /var/tmp/* \
  && apk del --purge .build-deps

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["su-exec","nobody","/sbin/tini","--","rekall"]
CMD ["-h"]

# https://github.com/google/rekall/archive/v1.5.2.tar.gz
# https://github.com/ForensicArtifacts/artifacts/archive/master.zip
# https://github.com/ForensicArtifacts/artifacts/archive/20160713.zip
# https://github.com/google/rekall/archive/v1.5.2.zip
