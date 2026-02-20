FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias + Meson actualizado
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    ninja-build \
    git \
    pkg-config \
    libglib2.0-dev \
    liborc-0.4-dev \
    flex \
    bison \
    gettext \
    autopoint \
    && pip3 install --upgrade meson \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /gstreamer

# Clonar y compilar GStreamer
RUN git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git . \
    && meson setup builddir \
    && ninja -C builddir

CMD ["bash"]
