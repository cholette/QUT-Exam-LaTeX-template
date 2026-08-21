%% QUTexam.cls — QUT examination paper class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{QUTexam}[2026/04/07 QUT Examination Paper Class]

%% Pass all options through to the base article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%% ---------------------------------------------------------------
%% Packages
%% ---------------------------------------------------------------
% \RequirePackage{times}
% \RequirePackage{newtxtext}
\usepackage{fontspec}
\setmainfont{Times New Roman}

\RequirePackage[a4paper,top=1.2cm,left=2.54cm,right=2.2cm,bottom=1cm,includeheadfoot]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amssymb}
\RequirePackage{xcolor}
\RequirePackage{siunitx}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{geometry}
\RequirePackage{caption}
\RequirePackage{multirow}


%% ---------------------------------------------------------------
%% Paper ID (set in the preamble with \paper{EGXXXX.YYS})
%% ---------------------------------------------------------------
\newsavebox{\paperid}
\newcommand{\paper}[1]{\sbox{\paperid}{#1}}

%% ---------------------------------------------------------------
%% Document structure commands
%% ---------------------------------------------------------------
\newcommand{\nomorequestions}{%
    \vspace{1.5cm}\centering\textbf{END OF PAPER}%
    \renewcommand{\pto}{}
}

\newcounter{question}
\newcommand{\questionnumber}[1]{%
    \vspace{5mm}{\bf\underline{QUESTION #1}}\vspace{5mm}%
    \setcounter{question}{#1}%
}

\newcommand{\newsection}[1]{%
    \begin{center}\bf{SECTION #1}\end{center}%
}

\newcommand{\startappendices}{%
    \newpage\setcounter{page}{1}
    \renewcommand{\thepage}{(\roman{page})}
}

%% ---------------------------------------------------------------
%% Score command: auto singular/plural
%% ---------------------------------------------------------------
\newcommand{\score}[1]{%
    \vspace{-0.75\baselineskip}%
    \ifthenelse{#1 < 2}{$ $\hfill(#1 mark)}{$ $\hfill(#1 marks)}%
}

%% ---------------------------------------------------------------
%% Enumerate label styles
%% ---------------------------------------------------------------
\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\labelenumi}{(\theenumi)}
\renewcommand{\theenumii}{\roman{enumii}}
\renewcommand{\labelenumii}{(\theenumii)}
\renewcommand{\theenumiii}{\Alph{enumiii}}
\renewcommand{\labelenumiii}{(\theenumiii)}

%% ---------------------------------------------------------------
%% Page layout
%% ---------------------------------------------------------------
\setlength{\parindent}{0cm}
\renewcommand{\headrulewidth}{0cm}
\setlength{\headsep}{5mm}

%% ---------------------------------------------------------------
%% Header / footer — default style
%% ---------------------------------------------------------------
\newcommand{\pto}{cont/...}

\lhead{}
\chead{\thepage}
\rhead{}
\lfoot{\usebox{\paperid}}
\cfoot{}
\rfoot{\pto}

%% Question continues on the next page
\fancypagestyle{q_continued_next_page}{%
    \lhead{}
    \chead{\thepage}
    \rhead{}
    \lfoot{%
        \begin{tabular}[b]{@{} l}
            Question \thequestion~continued overleaf \\[1.2ex]
            \usebox{\paperid}
        \end{tabular}%
    }
    \cfoot{}
    \rfoot{\pto}
}

%% Question continues on this page (carried over from previous page)
\fancypagestyle{q_continues}{%
    \lhead{Question \thequestion~continued}
    \chead{\thepage}
    \rhead{}
    \lfoot{\usebox{\paperid}}
    \cfoot{}
    \rfoot{\pto}
}

\AtBeginDocument{\pagestyle{fancy}}
