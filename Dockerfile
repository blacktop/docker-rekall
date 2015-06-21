FROM blacktop/yara

MAINTAINER blacktop, https://github.com/blacktop

# Install Rekall Dependancies
RUN buildDeps='build-base \
               git \
               python-dev \
               py-pip' \
  && set -x \
  && apk --update add ca-certificates python $buildDeps \
  && pip install --upgrade pip \
  && pip install acora \
                  argparse \
                  astroid \
                  codegen \
                  distorm3 \
                  Flask \
                  Flask-Sockets \
                  gevent \
                  gevent-websocket \
                  intervaltree \
                  ipython \
                  Jinja2 \
                  MarkupSafe \
                  PyAFF4 \
                  pycrypto \
                  pyelftools \
                  Pygments \
                  pytz \
                  PyYAML \
                  pyzmq \
                  setuptools \
                  tornado \
                  wsgiref \
  && echo "Installing Rekall..." \
  && pip install --pre rekall \
  && apk del --purge $buildDeps \
  && rm -rf /tmp/* /root/.cache /var/cache/apk/*
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# COPY rekallrc /root/.rekallrc

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

ENTRYPOINT ["rekall"]

CMD ["-h"]
