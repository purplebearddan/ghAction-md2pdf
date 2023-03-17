#!/usr/bin/python3

# imports
import os
from pathlib import Path
import re

directory: str = os.environ.get("GITHUB_WORKSPACE") # Directiory for crawling
headingColor: str = "#AF2CFF" # Colour of headings


# methods
def fileFinder(path: str, extension: str = 'md'):
    """
    Finds files in the specified path with the extension specified
    """
    files = []
    for path in Path('.').rglob(f'*.{extension}'):
        files.append(path)
    return sorted(files)

def main():
    # import various values for branding
    companyName: str = os.environ.get("COMPANYNAME") or "Purple Beard Training"
    courseName: str = os.environ.get("COURSENAME") or "Frontend Development"

    if companyName:
        # brand the first page
        os.system(f'echo \'<h1 style="color: #63028f">{companyName}</h1>\'')
    if courseName:
        # add the course name
        os.system(f'echo "<h2>{courseName}</h2>\n"')


    for filename in fileFinder(directory):
        # filename = filenameCleaner(filename)
        os.system(f'echo "\n<em>{filename}</em>\n"')
        os.system(f'cat "{filename}"')

if __name__ == "__main__":
    main()