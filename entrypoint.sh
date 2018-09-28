# !/bin/sh

dbus-daemon --system

chromium-browser \
    --headless \
    --no-sandbox \
    --disable-gpu \
    --disable-software-rasterizer \
    --disable-dev-shm-usage \
    --window-size=1920,1080 \
    --remote-debugging-address=0.0.0.0 \
    --remote-debugging-port=9222 