# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

LABEL maintainer="lzutao https://github.com/lzutao/docker-ibus-unikey"

# Set the working directory to /root
WORKDIR /root

ENV LANG="C.UTF-8"

# Prepare to installing texlive packages
RUN export DEBIAN_FRONTEND="noninteractive"\
 && apt-get update -qq \
    ## Install TeX Live and ghostscript
 && apt-get --no-install-recommends -qq \
        texlive-full \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-math-extra \
        texlive-lang-english \
        # For Vietnamese
        texlive-lang-other \
        # For minted
        texlive-latex-extra \
    ## Install biber for bibliography
        biber \
    ## Install latexmk for automated build
        latexmk \
    ## Install linting utilities
        chktex \
        lacheck \
    ## Install pandoc
        #pandoc=1.16*\
        #pandoc-citeproc=0.9*\
    ## Install minted's dependency
        python-pygments \
    ## Free huge amount of unused space
 && apt-get clean \
 && apt-get autoremove \
 && rm -rf \
        /var/lib/apt/lists/* \
        ## Remove temp file
        /tmp/* \
        /var/tmp/* \
        ## Remove unused manpage
        /usr/share/man/?? \
        /usr/share/man/??_* \
        /usr/share/man/??.* \
    ## Remove unused locales
 && find /usr/share/locale \
        -mindepth 1 \
        -maxdepth 1 \
        ! -name 'en' \
        -exec rm -rf {} +

# Run command when the container launches
#CMD ["echo", "hello world!"]
