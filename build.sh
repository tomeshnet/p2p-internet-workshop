#!/usr/bin/env bash

# Delete generated assets
rm -rf output
mkdir output

# Set CSS styles source
css="pdf.css"
echo "Using CSS styles from $css"

# Define starting directory
base_dir="$(pwd)"

# Generate general assets
for doc in general/*.md; do
    # Create folder for general assets
    mkdir output/general

    # Generate assets as .pdf
    if [ -f $doc ]; then
        out="output/general/$(echo "$doc" | sed 's|/|-|g' | sed 's|.md|.pdf|')"
        echo "Generating document from $doc to $out"
        markdown-pdf "$doc" --out "$out" --cwd general --css-path "$css"
    fi
done

# Go through each module
for mod in module-*; do
    # Create folder for module
    mkdir "$mod"

    # Generate lesson plan .pdf
    doc="$mod/README.md"
    if [ -f $doc ]; then
        out="output/$mod/$mod.pdf"
        echo "Generating lesson plan from $doc to $out"
        markdown-pdf "$doc" --out "$out" --cwd "$mod" --css-path "$css"
    fi

    # Generate worksheets as .pdf
    mkdir "output/$mod/worksheet"
    for doc in $mod/worksheet/*.md; do
        if [ -f $doc ]; then
            out="output/$mod/worksheet/$(echo "$doc" | sed 's|/|-|g' | sed 's|.md|.pdf|')"
            echo "Generating worksheet from $doc to $out"
            markdown-pdf "$doc" --out "$out" --cwd "$mod/worksheet" --css-path "$css"
        fi
    done

    # Generate presentation GitBook
    book="$mod/presentation"
    if [ -d $book ]; then
        out="output/$mod/presentation"
        echo "Generating presentation from $book to $out"
        gitbook build "$book" "$out"
    fi

    # Generate lesson plan .pdf
    doc="$mod-presentation.html"
    cd $mod
    if [ -f $doc ]; then
        out="../output/$mod/$mod-deck.pdf"
        echo "Generating lesson plan from $doc to $out"
        decktape remark "$doc" "$out" --chrome-arg=--allow-file-access-from-files
     fi
     cd $base_dir

done