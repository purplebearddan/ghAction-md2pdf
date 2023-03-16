#!/bin/sh -l

export FILE_PATH="/output/$PDF_FILE_NAME"

echo "creating output folder"
mkdir -p output

# working
echo "Generating PDF"
cd $GITHUB_
python3 /app/script.py | md-to-pdf --stylesheet "$PDF_STYLESHEET" > $FILE_PATH

echo "Output Folder Listing"
ls output