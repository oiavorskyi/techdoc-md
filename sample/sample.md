# Features

## Nested headers

Tools supports up to 5 level of nested headers created using appropriate number
of `#` characters. It is recommended to have empty line between header and
a following content to avoid potential issues.

### Sample third level

\lipsum[60]

\lipsum[30]

#### Sample fourth level

\lipsum[40]

##### Sample fifth level

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.

## Tables

Unfortunately Markdown support for tables is fairly limited, especially when it
comes to complex ones. The best balance between features and is complexity is
provided by `Grid` tables. They support multiline entries and even complex
structures like lists in cells in exchange for a somewhat complicated formatting
rules. There are tools such as `vim-table-mode` for `Vim` that greatly simplify
writing of tables in this format.

**Example table source**:

```
+-----------------+----------+-----------------+
| Header 1        | Header 2 | Header3         |
+=================+==========+=================+
| Value 11        | Value 12 | Value 13        |
+-----------------+----------+-----------------+
| Value 21        | Value 22 | Long value with |
|                 |          | multiple lines  |
+-----------------+----------+-----------------+
| End even lists: |          |                 |
|                 |          |                 |
| * One           |          |                 |
| * Two           |          |                 |
| * Three         |          |                 |
+-----------------+----------+-----------------+
```

**Resulting table**:

+-----------------+----------+-----------------+
| Header 1        | Header 2 | Header3         |
+=================+==========+=================+
| Value 11        | Value 12 | Value 13        |
+-----------------+----------+-----------------+
| Value 21        | Value 22 | Long value with |
|                 |          | multiple lines  |
+-----------------+----------+-----------------+
| End even lists: |          |                 |
|                 |          |                 |
| * One           |          |                 |
| * Two           |          |                 |
| * Three         |          |                 |
+-----------------+----------+-----------------+

Table: The Table Title

## Uml diagrams

Quite often technical documents contain some sort of UML diagrams. A traditional
approach would be to create such diagrams in a visual tools such as `Visio` or
`Omnigraffle` and then insert them as regular images to Markdown source file
using following syntax:

`![Caption](some/image/url)`

There are few downsides to this approach:

* A lot of time has to be spent on creation of the diagrams with marojity of it
    being devoted to a positioning of elements on a canvas rather than creation
    of a contents
* A tracking of changes is limited to an acknowledgement that there is a new
    binary version. It is impossible to tell what was exactly changed in a
    particular revision
* It is practlically impossible to use the same image in documents with
    different styles without spending a lot of time tweaking colors and fonts

The better alternative is to use a UML generation tool like `PlantUML` and
author the diagrams in a plain text format. This is exactly the approach this
tool follows.

Before producing a PDF output the tool generates image files from all `*.uml`
files found in the `uml` folder of the sources. The Markdown source then could
include reference to the image file in a standard way. Note that generated
images are being put into `media` folder so, for example, to include a diagram
generated from the source file `uml/sample.uml` one needs to reference it as
`media/sample`. The extension is optional and `png` will be used if not
specified.

**Sequence Diagram Example**:

![Sample Sequence Diagram](media/sample-sequence)

## Includes

### Test external java source code include:

```{.java}
<#include "include/HelloWorld.java">
```
