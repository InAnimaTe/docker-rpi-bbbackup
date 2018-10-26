FROM arm32v7/python:2-slim-stretch

COPY ssh_config /root/.ssh/config

RUN set -x && \
    mkdir /data && \
    apt-get update && \
    apt-get install -y ca-certificates openssh-client git && \
    pip install oauthlib && \
    pip install https://github.com/samkuehn/bitbucket-backup/archive/master.zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/*

COPY run /

ENTRYPOINT ["/run"]
