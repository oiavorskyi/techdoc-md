#!/bin/bash

if ! ls /source/*.md 1> /dev/null 2>&1; then
    echo "Error: No Markdown files (*.md) was found in a source directory"
    exit 1
fi

# Preparing workspace and copying source files

cp -rv /source/* .
cp -rv /templates/ .
cp -rv /include/ .
mkdir -p /workspace/media

# Generating UML diagrams
function parse_yaml {
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $@ |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("\.")}
         printf("%s%s:%s\n", vn, $2, $3);
      }
   }'
}

function generate_replacement {
    awk -F: '{
        VAL[$1] = $2;
    }
    END {
        for (key in VAL) {
            printf "-e '\''s/\$%s\$/%s/'\'' ", key, VAL[key];
        }
    }' $@
}

params=$(parse_yaml templates/*.yaml meta/*.yaml)

replacement_params=$(generate_replacement <(echo "$params"))
eval "find /workspace -type f -name *.skin -exec sed -i $replacement_params {} \;"

java -jar plantuml.jar \
    -tsvg \
    -config "/workspace/templates/plantuml.skin" \
    -o /workspace/temp \
    "/workspace/uml/*.uml"

# Pandoc doesn't support SVG => convert to PDF
find /workspace/temp -type f -name '*.svg' \
    -exec sh -c 'name=$(echo "$1" | sed 's/\.svg$/.pdf/') \
                 && echo "Converting $1 -> $name" \
                 && rsvg-convert -f pdf -o "$name" "$1"' \
           _  {} \;

# Copy if available
find /workspace/temp/ -name \*.png \
    -exec cp -v {} /workspace/media/ \;
find /workspace/temp/ -name \*.pdf \
    -exec cp -v {} /workspace/media/ \;

# Pre-processing all *.md files
find /workspace -type f -name '*.md' -exec gpp -U '<#' '>' '\B' '|' '>' '<' '>' '#' '' '{}' -o '{}'.mdp \;

OPTS=markdown+table_captions+backtick_code_blocks+fancy_lists+grid_tables+fenced_code_blocks+fenced_code_attributes+header_attributes+raw_tex+definition_lists+implicit_header_references+blank_before_header+escaped_line_breaks

exec pandoc -f $OPTS \
        --standalone \
        --listings \
        --latex-engine=xelatex \
        --default-image-extension=pdf \
        --chapters \
        --template=templates/default.latex \
        -o /output/output.pdf \
        *.mdp meta/*.yaml templates/*.yaml
