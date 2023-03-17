# imports
import os

directory: str = os.environ.get("GITHUB_WORKSPACE") # Directiory for crawling
headingColor: str = "#AF2CFF" # Colour of headings


# methods
def fileFinder(path: str, extension: str):
    """
    Finds files in the specified path with the extension specified
    """
    files = []
    for rootpath, _, filenames in os.walk(path):
        if filenames:
            filenames.sort(reverse=True)
            for f in filenames:
                if f.endswith(f".{extension}"):
                    files.append(f'{rootpath}/{f}')
    return files


def filenameCleaner(filename: str):
    """
    cleans the file name to just show the folder structure
    """
    filename: str = filename.replace('(', '\(').replace(')', '\)').replace(f'{directory}/', "").replace('.md', '')
    return filename

def main():
    # import various values for branding
    companyName: str = os.environ.get("COMPANYNAME") or "Purple Beard Training"
    courseName: str = os.environ.get("COURSENAME") or "Frontend Development"
    
    # brand the first page
    os.system(f'echo \'<h1 style="color: #63028f">{companyName}</h1>\n<h2> {courseName}</2>\n\n\'')


    for filename in fileFinder(directory, "md"):
        presentableFilename = filenameCleaner(filename)
        os.system(f'echo \'\n\n<em> {presentableFilename}</em>\n\'')
        os.system(f'cat \'{filename}\'')

if __name__ == "__main__":
    main()