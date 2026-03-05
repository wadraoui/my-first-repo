FROM ubuntu:22.04


# Instalamos dependencias y herramientas
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ninja-build \
    build-essential \
    flex \
    bison \
    git \
    libglib2.0-dev \
    && pip3 install meson

# Configuramos el directorio de trabajo
WORKDIR /gstreamer

# Clonamos (si no lo has copiado ya)
RUN git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git . --depth 1

# --- AQUÍ ESTÁ EL CAMBIO ---
# Usamos 'meson' directamente sin la ruta absoluta /usr/local/bin/
RUN meson setup builddir \
    -Dauto_features=disabled \
    -Dbase=enabled \
    && ninja -C builddir
