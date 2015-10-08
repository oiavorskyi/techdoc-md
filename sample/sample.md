# Abstract

This example ilustrates capabilities of the technical documentation authoring
tool that uses Markdown to write contents and Pandoc to transform it into a PDF
file for distribution.

The goal of the tool is to simplify a process of creation of a technical
documentation and allow authors to concentrate on a content rather than a
styling of resulting documents.

# Features

## Nested headers

Tools supports up to 5 level of nested headers created using appropriate number
of `#` characters. It is recommended to have empty line between header and
a following content to avoid potential issues.

### Sample third level

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.

#### Sample fourth level

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.

##### Sample fifth level

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.

# Tables

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

The Table Title
