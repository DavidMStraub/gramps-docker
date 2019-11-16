FROM debian:buster

RUN apt-get update && apt-get install -y \
    graphviz gir1.2-gexiv2-0.10 gir1.2-osmgpsmap-1.0 python3-icu \
    locales gettext wget \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && wget https://github.com/gramps-project/gramps/releases/download/v5.1.1/gramps_5.1.1-1_all.deb

RUN apt-get install -y ./gramps_5.1.1-1_all.deb \
    && rm -rf /var/lib/apt/lists/*

RUN gramps --version