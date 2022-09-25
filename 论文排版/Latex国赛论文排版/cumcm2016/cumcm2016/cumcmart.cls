\ProvidesClass{cumcmart}[2005/06/14 v050601, by Mao Ziyang]

\let\CCTCJKfonts=1
\LoadClass[11pt,oneside]{cctart}
  
\endlinechar -1

\newtoks\displaytitle
\newtoks\school
\newtoks\authorone
\newtoks\authortwo
\newtoks\authorthree
\newtoks\advisor

\renewcommand\contentsname{\centering \ziju{2}目录}

%------------------------ Page layout ----------------------------------

\topmargin=-15.4mm
\oddsidemargin=-0.4mm
\evensidemargin=-0.4mm
\textwidth=160mm
\textheight=247mm

\def\maketitle{%
  \null
  \thispagestyle{empty}%
  \leavevmode
  \input{declaration}
  \null
  \cleardoublepage
  \setcounter{page}{1}
  \begin{center}
     {\Large \@title \par}%
  \end{center}
  \vspace{3\ccht}\par
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{\ziju{2}摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\pushziti {\heiti\zihao{-4}\cnkeywordsname：#1}\popziti}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{\pushziti {\bfseries\zihao{-4}\enkeywordsname：#1}\popziti}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{\pushziti%
    \begin{center}{\zihao{4}\heiti \cnabstractname}\end{center}\vspace{1\ccht}
    \songti\zihao{-4}
    \@afterheading}
    {\par\popziti\newpage}

%------------------------ sections -------------------------
\renewcommand\section{\@startsection
            {section}{2}{\z@}%   {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\sectionformat}}
\renewcommand\sectionname{\arabic{section}}
\renewcommand\sectionformat{\selectfont\bfseries}

%----------------------- Theorems -----------------------------------
\newtheorem{theorem}{{定理}}
\newtheorem{proposition}{{命题}}
\newtheorem{lemma}{{引理}}
\newtheorem{corollary}{{推论}}[theorem]
\newtheorem{definition}{{定义}}
\newtheorem{example}{{例}}

\endlinechar `\^^M
\endinput
