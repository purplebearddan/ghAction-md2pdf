#!/bin/sh -l

export FILE_PATH="/out/$PDF_FILE_NAME"

echo "creating output folder"
mkdir -p /app/output

# working
echo "Generating PDF"

cp $GITHUB_WORKSPACE/* /app/input
python3 /app/script.py | md-to-pdf --stylesheet "$PDF_STYLESHEET" > $FILE_PATH

echo "Output Folder Listing"
ls output