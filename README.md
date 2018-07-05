# docker-texlive

[![Docker Build Status][docker shield]][docker hub]

**Note**: Add `[ci skip]` or `[skip ci]` to the git commit message if you changed only this `README.md`.

Contains full TeXLive-2017 using [Ubuntu 18.04][ubuntu 18] with:
- [minted] package and [pyments] for source code highlighting.
- [biber] for bibliography.
- [latexmk] for auto-build latex file .
- [chktex] and [lacheck] for checking syntax and errors in LaTex.
- Use UTF-8 locale by default.

## Usage on Travis

Travis automatic downloads the reposity to `TRAVIS_BUILD_DIR`,
use sample [Makefile] in this repo,
we have an example `.travis.yml`:
```yaml
dist: trusty
sudo: required
language: cpp
services:
  - docker          # docker still needs sudo
compiler:
  - gcc
before_install:
  - docker pull lzutao/docker-texlive
script:
  - docker run --rm -v "$TRAVIS_BUILD_DIR":"/LATEX" --workdir="/LATEX" lzutao/docker-texlive bash -c "
        lacheck main.tex
      && chktex main.tex
      && make main.tex"
```

## LICENSE

**docker-texlive** is offered under the terms of the [MTT Licence][LICENCE].

[docker shield]: https://img.shields.io/docker/build/lzutao/docker-texlive.svg?style=flat-square
[docker hub]: https://hub.docker.com/r/lzutao/docker-texlive/
[ubuntu 18]: https://www.ubuntu.com/
[minted]: https://www.ctan.org/pkg/minted
[biber]: https://ctan.org/pkg/biber
[lacheck]: https://ctan.org/pkg/lacheck
[latexmk]: https://ctan.org/pkg/latexmk
[chktex]: https://ctan.org/pkg/chktex
[pyments]: http://pygments.org/
[LICENCE]: COPYING
[Makefile]: Makefile
