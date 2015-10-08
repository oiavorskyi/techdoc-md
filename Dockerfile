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
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Prepare build infrastructure
RUN mkdir -p /workspace/templates
COPY templates/default/* /workspace/templates/
COPY scripts/md2pdf.sh /workspace/
RUN chmod +x /workspace/md2pdf.sh

# Defining entry point 
WORKDIR /workspace
CMD ["/workspace/md2pdf.sh"]
