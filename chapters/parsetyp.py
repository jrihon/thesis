from sys import argv
from os.path import isfile, isdir
from re import match
from os import listdir

## CONSTANTS
TYP_DIR = "chapters"


### MAIN
def main():
    directory = direct_exists(argv)

    modfile = directory + "/mod.typ"
    if not isfile(modfile): 
        exit(f"{modfile} does not exist")

    included_files = parse_modfile(modfile)

    all_citations = list()

    # I've had annoying experiences with mutable references in Python, so ..
    for filename in included_files:

        # start parsing file by file 
        # include only the citations which are not present in the `citations` object
        cites = parse_typfile(directory + "/" + filename)
        for cite in cites : 
            if cite not in all_citations : 
                all_citations.append(cite)

    write_dict_to_typ(directory, all_citations)
        




def direct_exists(cliargs : list[str]) -> str:
    # >>> python3 parsetyp.py 01_chapter/
    # >>> ["parsetyp.py", "01_chapter/"]
    try :
        directory = cliargs[1]
    except : 
        exit("No directory was prompted. Exitting ... ")

    # find mod file in directory
    if not isdir(directory) : 
        exit(f"{directory} is not a directory or does not exist. Exitting ... ")

    return directory


def parse_modfile(modfile: str) -> list[str]:

    included_files = list()

    with open(modfile, "r") as mod : 

        typ = mod.read()
        content = ""
        includefound = False
        commented = False
        brackfound = False

        # only need to find open `"` and closing `"`
        for i, char in enumerate(typ): 

            # Ignore commented rules
            if char == "/": 
                if typ[i:i+2] == "//": 
                    commented = True
                    continue 
            if commented : 
                if match(r'\n', typ[i:i+2]) : # regex up in this bi**h
                    commented = False
                    continue
                else : 
                    continue

            if char == "#":
                # match on the word mcite; length 6
                if typ[i:(i+8)] == "#include":
                    includefound = True
                    continue

            # find the R-brackets
            if includefound and not brackfound: 
                if char == '"': 
                    brackfound = True
                    continue

            if includefound and brackfound :
                if char != '"' :
                    content += char

                else :
                    includefound = False
                    brackfound = False

                    # if done, push to list and close out
                    if content not in included_files :
                        included_files.append(content)
                    content = ""

    return included_files


def parse_typfile(filename: str) -> list[str] : 
    with open(filename, "r") as typfile : 

        typ = typfile.read()
        total_content = list()
        content = ""
        citefound = False
        commented = False
        brackfound = 0

        for i, char in enumerate(typ): 

            # Ignore commented rules
            if char == "/": 
                if typ[i:i+2] == "//": 
                    commented = True
                    continue 
            if commented : # if line is commented, skip until newline is reached
                if match(r'\n', typ[i:i+2]) : # regex up in this bi**h
                    commented = False
                    continue
                else : 
                    continue

            if char == "#":
                # match on the word mcite; length 6
                if typ[i:(i+6)] == "#mcite":
                    citefound = True
                    continue

            # find the R-brackets
            if char == "(" and citefound :
                brackfound += 1
                continue

            if citefound and brackfound == 2 :
                if char != ")" :
                    content += char

                else :
                    citefound = False
                    brackfound = 0

                    splitlist = content.split(",")

                    if len(splitlist) > 1 :
                        for cont in splitlist :
                            cont = cont.strip()
                            if cont not in total_content :
                                total_content.append(cont)
                    else :
                        # if done, push to list and close out
                        content = content.strip()
                        if content not in total_content :
                            total_content.append(content)
                    content = ""

    return total_content


def search_yml(directori: str) -> str:

    directory = directori + "/"
    # search for a yml file.
    files = [x for x in listdir(directory) if x.endswith(".yml")]

    if len(files) > 1 :
        allfiles = "\n".join(files)
        exit(f"Conflict... Multiple yml files found in the {directory}:\n{allfiles}")
    elif len(files) == 0 :
        exit(f"No yml files found in the {directory}.")

    ymlfile = files[0]

    # ../sections/prompted_directory/bibliography.yml file
    return "../" + TYP_DIR + "/" + directory + ymlfile



def write_dict_to_typ(directory: str, all_citations: list[str]) -> None:

    directori = ""
    if directory.endswith("/"): 
         directori = directory[0:-1] # parse up until the final character
    bib = directori + "/bib_" + directori + ".typ" # make name to file unique
    with open(bib, "w") as bibdict :

        dictname = "dict_" + directori
        # start variable name and open bracket
        bibdict.write(f"#let {dictname} = (\n")

        # Write out >> "citation" : idx
        for idx, citation in enumerate(all_citations):
            bibdict.write(f"    {citation}: {idx+1}, \n")

        # close bracket
        bibdict.write(")\n")

        # make biblio variable
        ymlfile = search_yml(directori)
        bibdict.write("\n")
        bibdict.write(f"#let biblio = (\n")
        bibdict.write(f"    bibchapter: {dictname}, \n")
        bibdict.write(f"    bibyml: \"{ymlfile}\", \n")
        bibdict.write(")\n")



if "__main__" == __name__ : 
    main()
