# techdoc-md

The opinionated tool to generate technical documents such as requirements,
architecture and design specifications using Markdown. The predefined layout,
built-in support for UML diagrams, uniform approach for documents styling and
customization allow authors to concentrate on the content of the documents
instead of spending time fiddling with look and feel. Packaging of the tool as a
Docker container allows documentation to be generated on virtually any platform
without worrying about incompatibilities.

This tool is based on excellent open-source projects [Pandoc](http://pandoc.org)
and [PlantUML](http://plantuml.com). They do all the heavy lifting while
`techdoc-md` provides plumbing and default templates.

## Features

* Generation of PDF document from set of Markdown files
* Support for conversion of `*.uml` PlantUML source files into images that could
    be included into final document. The included images are vector-based
* Support for defining document metadata such as author, title and even abstract
    in an separate `*.yaml` file
* Support for changing the style (colors and fonts) of documents via separate
    `*.yaml` file. These changes also affect generated UML diagrams making the
    process of adjusting style throughout entire document very straightforward.
* Support for including of source code listings from separate files (color and
    font settings are honored as well)
* Support full redefinition of the Pandoc template if required

## Document project structure

```
.
├── *.md - set of Markdown files compiled into final document
├── include
│   └── *.(java,cpp,rb,etc.) - source code files to include
├── media
│   └── *.(png,jpg,pdf,etc.) - media files to include
├── meta
│   ├── metadata.yaml - document metadata
│   └── skin.yaml - styling parameters (fonts and colors)
└── uml
    └── *.uml - PlantUML source code for UML diagrams

```

## Simple example

To see example output, run following command in `sample` folder:

```
docker run --rm \
	-v `pwd`:/source:ro \
	-v `pwd`/output:/output \
	oiavorskyi/techdoc-md
```

Note: make sure that you have Docker installed on your machine first and that
you have connected to it.

The `sample` folder should provide overview of major customization points and
examples of usage. It will be enhanced over time to show as much capabilities as
possible. You could copy `skin.yaml` file from the default template and play
with fonts and colors to see the effect on the document.

## Customizing template

If you wish to make additional customizations to the template used to generate
the PDF documentation you could make a copy of `templates/default` directory and
change files there. Then you could point the tool to the new template directory:

```
docker run --rm \
	-v `pwd`:/source:ro \
	-v `pwd`/output:/output \
    -v <path_to_template>:/templates \
	oiavorskyi/techdoc-md
```

## Todo

* Support for nested directories in `uml` directory
* Change default image extension to `*.png`
* Complete support of skin parameters for all types of PlantUML diagrams
* Add support for `*.svg` files in `media` folder
* Substitution of variables in Markdown sources files
* Change-list page generation from Git commits
* Enhance example to include most common types of markup and customizations
* Add basic support for MS Word export (for collaboration with those who cannot
    annotate PDF files)
* Add support for MS Word tables in sources
