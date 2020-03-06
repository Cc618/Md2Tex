# Md2Tex

Md2Tex is a shell script to convert Markdown to Tex.
This script outputs the result in stdout but it can be redirected with :

```sh
./md2tex.sh file.md > result.tex
```

## Example

```md
# Title

## Subtitle

Text

### Subsubtitle

I am a
pretty
short
paragraph but
I have many lines

#### Sub3title

##### Sub4title

### I can contain special chars : élève à ë Ü

_Multiple words emph_
*emph*

**bold**
__bold__
```

Gives :

```tex
\section{Title}

\subsection{Subtitle}

Text

\subsubsection{Subsubtitle}

I am a
pretty
short
paragraph but
I have many lines

\paragraph{Sub3title}

\subparagraph{Sub4title}

\subsubsection{I can contain special chars : élève à ë Ü}

\emph{Multiple words emph}
\emph{emph}

\textbf{bold}
\textbf{bold}
```

## Features

- Sections
- Style (bold / emph)
- Option to disable wildcards ($NO_WILDCARD)

## Depedencies

Requires the __sed__ and __cat__ command.
