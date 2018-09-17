#!/usr/bin/env bash

# Delete generated assets
rm -rf output
mkdir output

# Set CSS styles source
css="pdf.css"
echo "Using CSS styles from $css"

# Generate general assets
for doc in general/*.md; do
    if [ -f $doc ]; then
        out="output/$(echo "$doc" | sed 's|/|-|g' | sed 's|.md|.pdf|')"
        echo "Generating document from $doc to $out"
        markdown-pdf "$doc" --out "$out" --cwd general --css-path "$css"
    fi
done

# Go through each module
for mod in module-*; do
    # Generate lesson plans .pdf
    doc="$mod/README.md"
    if [ -f $doc ]; then
        out="output/$mod.pdf"
        echo "Generating lesson plan from $doc to $out"
        markdown-pdf "$doc" --out "$out" --cwd "$mod" --css-path "$css"
    fi

    # Generate worksheets as .pdf
    for doc in $mod/worksheet/*.md; do
        if [ -f $doc ]; then
            out="output/$(echo "$doc" | sed 's|/|-|g' | sed 's|.md|.pdf|')"
            echo "Generating worksheet from $doc to $out"
            markdown-pdf "$doc" --out "$out" --cwd "$mod/worksheet" --css-path "$css"
        fi
    done

    # Generate presentation GitBooks
    book="$mod/presentation"
    if [ -d $book ]; then
        out="output/$(echo "$book" | sed 's|/|-|g')"
        echo "Generating presentation from $book to $out"
        gitbook build "$book" "$out"
    fi
done
