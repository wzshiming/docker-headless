
ARG ALPINE_VERSION=3.8

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="wzshiming@foxmail.com"

# Installs package.
RUN \
    apk add -U --no-cache \
    chromium \
    font-noto

# Install cjk and emoji.
RUN cd /usr/share/fonts \
    && wget https://github.com/googlei18n/noto-emoji/blob/master/fonts/NotoColorEmoji.ttf?raw=true \
    && wget https://github.com/googlei18n/noto-cjk/blob/master/NotoSansCJK-Medium.ttc?raw=true \
    && fc-cache -fv 

# Cleanup.
RUN rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

# Add Chrome as a user
RUN adduser -D chrome

# Run Chrome as non-privileged
USER chrome
WORKDIR /home/chrome

EXPOSE 9222

# Autorun chromium browser
ENTRYPOINT ["chromium-browser"]

CMD ["--headless", "--no-sandbox", "--disable-gpu", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222"]
