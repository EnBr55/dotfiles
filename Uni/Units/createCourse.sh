#!/usr/bin/env bash

if [ "$1" == "" ]; then
  echo "Missing parameter - Course Name"
  exit 1
fi

courseName=$1

mkdir $courseName

echo "#!/usr/bin/env bash
dir='lecs'
> inputs.tex
for file in \$dir/*.tex
  do echo \"\input{\$file}\" >> inputs.tex
done" > ./$courseName/compileInputs.sh

echo "\documentclass[12pt]{article}
\usepackage{amsmath,amsthm,amsfonts,amssymb,amscd}
\usepackage[margin=3cm]{geometry}
\usepackage{standalone}

\usepackage{titlesec}
\titleformat{\section}{\normalfont\Large\bfseries}{}{0pt}{}
\titleformat{\subsection}{\normalfont\large\bfseries}{}{0pt}{}

\makeatletter\let\Title\@title\makeatother

\title{$courseName}
\author{Ben Braham}
\date{}

\begin{document}

\maketitle

% make sure to run compileInputs.sh to update included files
\input{inputs.tex}

\end{document}
"> ./$courseName/main.tex

mkdir $courseName/lecs
