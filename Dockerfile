FROM blacktop/yara

MAINTAINER blacktop, https://github.com/blacktop

# Install Rekall Dependancies
RUN apk-install ca-certificates py-setuptools
RUN apk-install -t build-deps build-base \
                              git \
                              python-dev \
                              py-pip \
  && set -x \
  && export PIP_NO_CACHE_DIR=off \
  && export PIP_DISABLE_PIP_VERSION_CHECK=on \
  && pip install --upgrade pip wheel \
  && pip install pytz \
                 Flask \
                 acora \
                 pyzmq \
                 Jinja2 \
                 PyAFF4 \
                 PyYAML \
                 gevent \
                 astroid \
                 codegen \
                 ipython \
                 tornado \
                 wsgiref \
                 Pygments \
                 argparse \
                 distorm3 \
                 pycrypto \
                 MarkupSafe \
                 pyelftools \
                 intervaltree \
                 Flask-Sockets \
                 gevent-websocket \
  && echo "Installing Rekall..." \
  && pip install --pre rekall \
  && rm -rf /tmp/* /root/.cache /var/cache/apk/* /var/tmp/* \
  && apk del --purge build-deps

COPY rekallrc /root/.rekallrc

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT ["rekall"]

CMD ["-h"]
