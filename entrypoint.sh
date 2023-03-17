#!/bin/sh -l

export FILE_PATH="$GITHUB_WORKSPACE/out/$PDF_FILE_NAME"
export MD_FILE_PATH="$GITHUB_WORKSPACE/out/result.md"

echo "installing pretty-markdown-pdf"
npm install -g pretty-markdown-pdf
echo "creating output folder"
mkdir -p "$GITHUB_WORKSPACE/out"

# working
echo "Generating PDF"

# cp $GITHUB_WORKSPACE/* /app/input
python3 /app/script.py > "$MD_FILE_PATH"
pretty-md-pdf -i $MD_FILE_PATH -o $FILE_PATH
echo "DONE! - $FILE_PATH"
echo "FILE_PATH=$FILE_PATH" >> $GITHUB_ENV