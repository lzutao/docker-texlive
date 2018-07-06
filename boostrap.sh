#!/usr/bin/env bash
export DEBIAN_FRONTEND="noninteractive"

apt-get update -qq

declare -a TEX_APPS=(
    texlive-latex-recommended
    texlive-fonts-extra
    texlive-fonts-recommended
    texlive-lang-english
    ## For Vietnamese
    texlive-lang-other
    ## For bibliography
    biber
    ## For minted
    texlive-latex-extra
    ## minted's dependency
    python-pygments
    ## latexmk for automated build
    make
    latexmk
    ## linting utilities
    chktex
    lacheck
    ## Install pandoc
    #pandoc
    #pandoc-citeproc
  )


## Install TeX Live and ghostscript
apt-get install --no-install-recommends -qq "${TEX_APPS[@]}"

## Free huge amount of unused space
apt-get clean
apt-get autoremove

## Remove temp file
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Remove unused manpage
rm -rf /usr/share/man/?? /usr/share/man/??_* /usr/share/man/??.*

## Remove unused locales
find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' -exec rm -rf {} +
