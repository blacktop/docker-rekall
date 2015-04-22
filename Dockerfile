FROM blacktop/yara

MAINTAINER blacktop, https://github.com/blacktop

# Install Volatility Dependancies
RUN buildDeps='build-essential \
               python-dev \
               python-pip' \
  && set -x \
  && apt-get update -qq \
  && apt-get install -yq $buildDeps \
                         ca-certificates \
                         python \
  && pip install --upgrade pip \
  && /usr/local/bin/pip install --upgrade acora \
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
  && apt-get purge -y --auto-remove $buildDeps \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Rekall and remove install dir after to conserve space
RUN /usr/local/bin/pip install --pre rekall \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

ENTRYPOINT ["rekall"]

CMD ["-h"]
