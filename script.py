#!/usr/bin/python3

# imports
import os
from pathlib import Path

directory: str = os.environ.get("GITHUB_WORKSPACE") # Directiory for crawling
headingColor: str = os.environ.get("BRANDCOLOR") or "#63028f" # Colour of headings


# methods
def fileFinder(path: str, extension: str = 'md'):
    """
    Finds files in the specified path with the extension specified
    """
    files = []
    for path in Path('.').rglob(f'*.{extension}'):
        files.append(path)
    
    if files:
        files = sorted(files)
        mainReadme = files[-1]
        files.pop()
        files.insert(0, mainReadme)
    
    return files

def main():
    # import various values for branding
    companyName: str = os.environ.get("COMPANYNAME") or "Purple Beard Training"
    courseName: str = os.environ.get("COURSENAME") or "Frontend Development"

    os.system(f'echo \'<section><h1 style="color: {headingColor}">{companyName}</h1>\'')
    os.system(f'echo "<h2>{courseName}</h2>\n"')

    os.system(f'echo "<h3>Repo: <a href=\"$GITHUB_SERVER_URL/$GITHUB_REPOSITORY\">$GITHUB_SERVER_URL/$GITHUB_REPOSITORY</a></h3></section>\n"')
    for filename in fileFinder(directory):
        # filename = filenameCleaner(filename)
        os.system(f'echo "\n<em>{filename}</em>\n"')
        os.system(f'cat "{filename}"')

if __name__ == "__main__":
    main()