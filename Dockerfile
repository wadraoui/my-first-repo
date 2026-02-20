FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    meson \
    ninja-build \
    git \
    pkg-config \
    libglib2.0-dev \
    liborc-0.4-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /gstreamer

RUN git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git . \
    && meson setup build \
    && ninja -C build

CMD ["bash"]
