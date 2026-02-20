FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    meson \
    ninja-build \
    git \
    pkg-config \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    libglib2.0-dev \
    liborc-0.4-dev \
    flex \
    bison \
    gettext \
    autopoint \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /gstreamer

RUN git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git .

RUN meson setup builddir \
    --buildtype=release \
    -Dauto_features=disabled \
    -Dbase=enabled

RUN ninja -C builddir

CMD ["bash"]
