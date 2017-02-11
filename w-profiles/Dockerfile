FROM blacktop/yara:3.5

MAINTAINER blacktop, https://github.com/blacktop

ENV REKALL_VERSION 1.6.0

RUN apk-install py-setuptools py-cffi libstdc++ bash cabextract
RUN apk-install -t .build-deps \
                    unzip \
                    py-pip \
                    libc-dev \
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
  && pip install --upgrade pip wheel setuptools pyparsing==2.1.5 \
  && echo "===> Installing Rekall..." \
  && pip install rekall==$REKALL_VERSION rekall-agent==$REKALL_VERSION \
  && echo "===> Installing rekall-profiles..." \
  && cd /tmp \
  && wget https://github.com/google/rekall-profiles/archive/master.zip \
  && unzip master.zip \
  && cd rekall-profiles-master \
  && mv v1.0 /rekall-profiles \
  && rm -rf /tmp/* /root/.cache /var/cache/apk/* /var/tmp/* \
  && apk del --purge .build-deps

COPY rekallrc /root/.rekallrc

ENV PATH /sbin:$PATH

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["tini","--","rekall"]
CMD ["-h"]
