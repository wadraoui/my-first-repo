FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias básicas
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
    && rm -rf /var/lib/apt/lists/*

# Instalar Meson actualizado con pip
RUN pip3 install --upgrade meson

WORKDIR /gstreamer

# Clonar GStreamer
RUN git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git .

# Crear build directory y compilar
RUN /usr/local/bin/meson setup builddir \
    && /usr/local/bin/ninja -C builddir

CMD ["bash"]
