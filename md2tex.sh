#/bin/sh
# Markdown to Tex script
# usage : md2tex.sh <file>

if [ "$#" -eq 1 ]
then
    sed 's/^#\s\(.*$\)/\\section{\1}/' $1 \
        | sed 's/^##\s\(.*$\)/\\subsection{\1}/' \
        | sed 's/^###\s\(.*$\)/\\subsubsection{\1}/' \
        | sed 's/^####\s\(.*$\)/\\paragraph{\1}/' \
        | sed 's/^#####\s\(.*$\)/\\subparagraph{\1}/' \
        | sed 's/\b__\([^_]\+\)__\b/\\textbf{\1}/g' \
        | sed 's/\*\*\([^\*]\+\)\*\*/\\textbf{\1}/g' \
        | sed 's/\b_\([^_]\+\)_\b/\\emph{\1}/g' \
        | sed 's/\*\([^\*]\+\)\*/\\emph{\1}/g'
else
    echo 'usage : md2tex.sh <file>'
    exit -1
fi
