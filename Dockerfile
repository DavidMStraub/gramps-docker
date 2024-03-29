FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    appstream pkg-config libcairo2-dev \
    gir1.2-gtk-3.0 libgirepository1.0-dev libicu-dev \
    graphviz gir1.2-gexiv2-0.10 gir1.2-osmgpsmap-1.0 \
    locales gettext wget python3-pip python3-pil \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && wget https://github.com/gramps-project/gramps/releases/download/v5.1.6/gramps_5.1.6-1_all.deb --no-check-certificate

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y ./gramps_5.1.6-1_all.deb \
    && rm -rf /var/lib/apt/lists/*

RUN gramps --version