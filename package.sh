#!/usr/bin/env bash

RELEASE_VERSION=$1

# Create directory for release assets ready to be published
rm -rf publish
mkdir publish

# Package assets in tar.gz and zip formats
tar --create --gzip -f "publish/workshop-materials-${RELEASE_VERSION}.tar.gz" -C output .
cd output; zip --recurse-paths "../publish/workshop-materials-${RELEASE_VERSION}.zip" .; cd ..