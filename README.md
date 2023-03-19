# ghAction-md2pdf

> Markdown to PDF converter for documentation related to courses

## Usage

```yml
name: MD to PDF Conversion

on: push

jobs:
  Convert:
    runs-on: ubuntu-latest
    steps:

    # This step is required
    - name: Clone repo 
      uses: actions/checkout@v2

    # exports $FILE_PATH to $GITHUB_ENV for use in another step
    - name: Generate PDF from Markdown Files
      uses: purplebearddan/ghAction-md2pdf@v1.0.2
      with:
        pdf_file_name: 'result.pdf'
    
    # Your next job here
```
