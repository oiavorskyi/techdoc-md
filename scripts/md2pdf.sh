#!/bin/bash

if ! ls /source/*.md 1> /dev/null 2>&1; then
    echo "Error: No Markdown files (*.md) was found in a source directory" 
    exit 1
fi

OPTS=markdown+simple_tables+table_captions+backtick_code_blocks+fancy_lists+multiline_tables+grid_tables+fenced_code_blocks+header_attributes

exec pandoc -f $OPTS \
        --standalone \
        --latex-engine=xelatex \
        --template=templates/default.latex \
        -o /output/output.pdf \
        /source/*.md
