FROM debian:stretch


RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      ca-certificates \
      curl \
      dnsutils \
      git \
      htop \
      httping \
      iperf3 \
      less \
      netcat \
      nmon \
      python3 \
      python3-pip \
      socat \
      telnet \
      tree \
      wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --system --uid 1001 toolkit
WORKDIR /


USER 1001



EXPOSE 8080

CMD python3 -m http.server 8080 --cgi