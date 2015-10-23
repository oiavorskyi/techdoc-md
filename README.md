# techdoc-md
Tool for producing technical documentation using Markdown and Pandoc

## Simple example

To see example output, run following command in `sample` folder:

``docker run --rm -v `pwd`:/source:ro -v `pwd`/output:/output oiavorskyi/techdoc-md``

## Todo

* Support for logo at title page
* Substitution of variables in Markdown sources files
* Title page generation
* Change-list page generation
* Enhance example to include most common types of markup
