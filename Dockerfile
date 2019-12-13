FROM python:3.7.5-stretch

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      ca-certificates \
      curl \
      dnsutils \
      git \
      gnupg \
      htop \
      httping \
      iperf3 \
      less \
      netcat \
      nmon \
      procps \
      python3-setuptools \
      socat \
      telnet \
      tree \
      wget \
      vim

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get install nodejs -yq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install http-server -g

RUN adduser --disabled-password --system --uid 1001 toolkit
WORKDIR /

USER 1001

EXPOSE 8000

CMD http-server -p 8000
