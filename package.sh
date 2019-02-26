#!/usr/bin/env bash

RELEASE_VERSION=$1

###################################################
# Package archives for releasing to GitHub Release 
###################################################

# Create directory for release assets ready to be published
rm -rf publish
mkdir publish

# Package assets in tar.gz and zip formats
tar --create --gzip -f "publish/workshop-materials-${RELEASE_VERSION}.tar.gz" -C output .
cd output; zip --recurse-paths "../publish/workshop-materials-${RELEASE_VERSION}.zip" .; cd ..

##########################################
# Generate hosted assets for GitHub Pages
##########################################

# Replace home page in site directory with repo README.md
homepage="site/index.md"
rm -f "$homepage"
{
    echo "---"
    echo "layout: home"
    echo "---"
} > "$homepage"
cat "README.md" >> "$homepage"

# Create directory for release assets in site directory
art="site/_articles"
rm -rf "$art"
mkdir "$art"

# Create folder for general assets
dst="$art/general"
mkdir "$dst"

# Create .pdf assets index file
{
    echo "---"
    echo "layout: page"
    echo "title: 'General'"
    echo "---"
    echo "## General PDF assets" >> "$dst.md"
} > "$dst.md"

# Copy .pdf assets
for doc in output/general/*.pdf; do
    if [ -f $doc ]; then
        cp "$doc" "$dst"
        filename=$(basename $doc)
        echo "* [$filename]($filename)" >> "$dst.md"
    fi
done

# Go through each module
for mod in module-*; do
    # Create folder for module
    dst="$art/$mod"
    mkdir "$dst"

    # Copy .md lesson plan
    cp "$mod/README.md" "$dst.md"

    # Create presentation index file
    {
        echo "---"
        echo "layout: page"
        echo "title: 'Presentation slides'"
        echo "module: '$(echo "$mod" | sed 's/module-/Module /')'"
        echo "---"
        echo "## $(echo "Presentation slides for $mod" | sed 's/module-/Module /')"
    } > "$dst/presentation.md"

    # Copy presentation
    cp -r "output/slide-files" "$dst/slide-files"
    mkdir "$dst/presentation"
    cp -r "output/$mod/slide-images" "$dst/presentation/slide-images"
    cp "output/$mod/presentation.html" "$dst/presentation/index.html"
    echo "* [presentation](index.html)" >> "$dst/presentation.md"

    # Create .pdf assets index file
    {
        echo "---"
        echo "layout: page"
        echo "title: 'PDF assets'"
        echo "module: '$(echo "$mod" | sed 's/module-/Module /')'"
        echo "---"
        echo "## $(echo "PDF assets for $mod" | sed 's/module-/Module /')"
    } > "$dst/pdf-assets.md"

    # Copy .pdf assets
    mkdir "$dst/pdf-assets"

    echo "" >> "$dst/pdf-assets.md"
    echo "### Lesson plan" >> "$dst/pdf-assets.md"
    cp "output/$mod/$mod.pdf" "$dst/pdf-assets"
    filename="$mod.pdf"
    echo "* [$filename]($filename)" >> "$dst/pdf-assets.md"

    if [ -d output/$mod/handouts ] && [ "$(ls output/$mod/handouts/*.pdf 2>/dev/null)" ]; then
        echo "" >> "$dst/pdf-assets.md"
        echo "### Class handouts" >> "$dst/pdf-assets.md"
        for doc in output/$mod/handouts/*.pdf; do
            if [ -f $doc ]; then
                cp "$doc" "$dst/pdf-assets"
                filename=$(basename $doc)
                echo "* [$filename]($filename)" >> "$dst/pdf-assets.md"
            fi
        done
    fi
done

# Build static website
cd site; bundle install; bundle exec jekyll build; cd ..
