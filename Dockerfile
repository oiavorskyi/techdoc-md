FROM debian:latest

MAINTAINER Oleg Iavorskyi <oleg.iavorskyi@gmail.com>

ENV LANG C.UTF-8
ENV LC_CTYPE C.UTF-8

# Installing all "heavy" dependencies in one RUN so Docker cache the
# intermediate container
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    pandoc \
    openjdk-7-jre \
    graphviz \
    texlive-latex-base \
    texlive-xetex \
    latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# These are likely to change dependencies
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    lmodern \
    curl \
    unzip \
    gpp \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install fonts
RUN mkdir -p /usr/share/fonts/opentype/addon \
    && cd /usr/share/fonts/opentype/addon \
    && curl -O -J -L http://www.fontsquirrel.com/fonts/download/Journal \
    && curl -O -J -L http://www.fontsquirrel.com/fonts/download/source-code-pro \
    && curl -O -J -L http://www.fontsquirrel.com/fonts/download/source-sans-pro \
    && curl -O -J -L http://www.fontsquirrel.com/fonts/download/source-serif-pro \
    && find . -name '*.zip' -exec unzip {} \; \
    && cd - \
    && fc-cache -fv

# Downloading latest plantuml jar file
RUN mkdir -p /workspace \
    && cd /workspace && curl -O -J -L \
    http://sourceforge.net/projects/plantuml/files/plantuml.jar/download \
    && cd -

# Preparing build infrastructure
RUN mkdir -p /include
COPY templates/default/* /templates/
COPY scripts/md2pdf.sh /workspace/
RUN chmod +x /workspace/md2pdf.sh

# Defining entry point
WORKDIR /workspace
CMD ["/workspace/md2pdf.sh"]
