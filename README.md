# shellscripts

collection of my personal shell scripts

- [bin/dia2file.sh](dia2file.sh) - convert a given diagram file (PlantUML - pml, GraphViz - dot, ERD - erd, Ditaa - ditaa) into a image file using the kroki webservice
- [bin/ltdr.sh](tldr.sh) - use the github repo of tldr to fetch help pages

## Installation

```
wget https://github.com/mittelmark/shellscripts/raw/refs/heads/main/bin/tldr.sh -O ~/.local/bin/tldr.sh
chmod 755 ~/.local/bin/tldr.sh
wget https://github.com/mittelmark/shellscripts/raw/refs/heads/main/bin/dia2file.sh -O ~/.local/bin/dia2file.sh
chmod 755 ~/.local/bin/dia2file.sh
```

## Examples

```bash
dia2file.sh infile.pml outfile.svg
dia2file.sh infile.dot ## creates infile.svg
tldr.sh ls
```
