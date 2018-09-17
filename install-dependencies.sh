#!/usr/bin/env bash

# Check for required tools
echo "Checking for markdown-pdf node module"
npm -g list markdown-pdf
S=$?
if [ $S -ne 0 ]; then
    echo "markdown-pdf is missing, install by running:"
    echo "    npm install -g markdown-pdf"
    return $S
fi

echo "Checking for gitbook-cli node module"
npm -g list gitbook-cli
S=$?
if [ $S -ne 0 ]; then
    echo "gitbook-cli is missing, install by running:"
    echo "    npm install -g gitbook-cli"
    return $S
fi