#!/bin/sh
# Markdown to Tex script
# usage : md2tex.sh <file>
# Set $NO_WILDCARD to disable bold / emph with * (usefull to add code sections)

if [ "$#" -eq 1 ]
then
    if [ -z "$NO_WILDCARD" ]
    then
        # Wildcards are used for emph / bf
        WILDCARD_2="sed 's/\*\*\([^\*]\+\)\*\*/\\\\textbf{\1}/g'"
        WILDCARD_1="sed 's/\*\([^\*]\+\)\*/\\\\emph{\1}/g'"
    else
        # Wildcards disabled
        WILDCARD_2="cat"
        WILDCARD_1="cat"
    fi

    sed 's/^#\s\(.*$\)/\\section{\1}/' $1 \
        | sed 's/^##\s\(.*$\)/\\subsection{\1}/' \
        | sed 's/^###\s\(.*$\)/\\subsubsection{\1}/' \
        | sed 's/^####\s\(.*$\)/\\paragraph{\1}/' \
        | sed 's/^#####\s\(.*$\)/\\subparagraph{\1}/' \
        | sed 's/\b__\([^_]\+\)__\b/\\textbf{\1}/g' \
        | eval $WILDCARD_2 \
        | sed 's/\b_\([^_]\+\)_\b/\\emph{\1}/g' \
        | eval $WILDCARD_1
else
    echo 'usage : md2tex.sh <file>'
    exit -1
fi
