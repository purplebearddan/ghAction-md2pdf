#!/bin/sh -l

export FILE_PATH="$GITHUB_WORKSPACE/out/$PDF_FILE_NAME"

echo "installing md-to-pdf"
npm install -g md-to-pdf
echo "creating output folder"
mkdir -p "$GITHUB_WORKSPACE/out"

# working
echo "Generating PDF"

# cp $GITHUB_WORKSPACE/* /app/input
python3 /app/script.py | md-to-pdf --launch-options '{ "args": ["--no-sandbox"] }' --basedir $GITHUB_WORKSPACE > $FILE_PATH
echo "DONE! - $FILE_PATH"
echo "FILE_PATH=$FILE_PATH" >> $GITHUB_ENV