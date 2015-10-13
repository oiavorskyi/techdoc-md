# techdoc-md
Tool for producing technical documentation using Markdown and Pandoc

## Simple example

To see example output, run following command in `sample` folder:

``docker run --rm -v `pwd`:/source:ro -v `pwd`/output:/output oiavorskyi/techdoc-md``

## Todo

* Ability to mount templates folder and not changing anything there
* Substitution of variables in Markdown sources files
* Handling of source code inclusion
* Inclusion of media files
* TOC generation
* Title page generation
* Change-list page generation
