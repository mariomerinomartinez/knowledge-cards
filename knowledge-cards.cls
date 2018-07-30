%----------------------------------------------------------------------
% This is the knowledge-cards class for creating beautiful two-page
% themed information cards. The class is based on tufte-latex. The 
% class takes no options.
%
% Author: Mario Merino <mario.merino@uc3m.es>
% Date: 2018-06-01
%----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{knowledge-cards}
\LoadClass[a4paper]{tufte-handout}

% Load basic packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[yearmonthsep={},monthdaysep={}]{datetime2}
\RequirePackage{titlecaps}
 
% Set default page style for non-card pages
\pagestyle{empty}%
\geometry{left=22mm,
          top=22mm,
          textwidth=110mm,
          marginparsep=8mm,
          marginparwidth=50mm,
          textheight=253mm}
 
% Provide a means to define new card types (basically, a name-color pair)
\newcommand{\newcardtype}[2]{%
    \definecolor{#1}{RGB}{#2}%
}
 
% Redefine text styles
\providecommand{\cardtype}{black}% default value
\newcommand{\bb}[1]{{\color{\cardtype}\textbf{#1}}}
\newcommand{\ii}[1]{{\color{\cardtype}\textit{#1}}}
\newcommand{\cc}[1]{{\color{\cardtype}\texttt{#1}}}
\newcommand{\link}[2]{%
    \href{#2}{\color{\cardtype}#1}
}
\newcommand{\cardlink}[3]{%
    \href{#3}{\textcolor{#1}{\titlecap{#2}}}
}

% itemize/enumerate item vertical separation distance and color
\RequirePackage{enumitem}
\setitemize{noitemsep}
\setenumerate{noitemsep} 
\setlist[enumerate,1]{label=\textcolor{\cardtype}{\arabic*.}} 
\setlist[enumerate,2]{label=\textcolor{\cardtype}{\alph*.}}
\setlist[itemize,1]{label=\textcolor{\cardtype}{\tiny$\blacksquare$}}
\setlist[itemize,2]{label=\textcolor{\cardtype}{$\bullet$}}

% Phantom sections
\providecommand\phantomsection{}

% Card sectioning 
\titleformat{\section}%
  [hang]% shape
  {\normalfont\Large\itshape\color{\cardtype}}% format applied to label+text
  {\thesection}% label
  {1em}% horizontal separation between label and title body
  {}% before the title body
  []% after the title body     

\titleformat{\subsection}%
  [hang]% shape
  {\normalfont\large\itshape\color{\cardtype}}% format applied to label+text
  {\thesubsection}% label
  {1em}% horizontal separation between label and title body
  {}% before the title body
  []% after the title body

% Load tikz and calc library    
\RequirePackage{tikz}
\usetikzlibrary{calc}    
    
% QR codes    
\RequirePackage{qrcode}    
    
% Card pages 
\newcommand{\card}[5]{%
% #1: card type, 
% #2: card code,
% #3 card title, 
% #4 card version, 
% #5 info in QR code.
\renewcommand{\cardtype}{#1}
\cleardoublepage
\fancypagestyle{card}{%
    \fancyhf{} 
    \fancyhead[RO]{%
        \begin{tikzpicture}[overlay,remember picture]
            \fill [color=#1](current page.north east) rectangle
                ($ (current page.south east) + (-1cm,0cm) $);
            \fill [color=#1](current page.east) ++(0.5cm,0cm) circle(2cm);
            \draw [color=white](current page.east) ++(-0.75cm,0cm) 
                node[anchor=center] {\Large #2};
            \draw [color=white](current page.north east) ++(-0.5cm,-0.5cm) node[rotate=90,anchor=east] {\smallcaps{#1: #3}};
            \draw [color=white](current page.south east) ++(-0.5cm,+0.5cm) node[rotate=90,anchor=west] {\smallcaps{Version: #4}};
        \end{tikzpicture}
        }
    \fancyhead[RE]{%
        \begin{tikzpicture}[overlay,remember picture]
            \fill [color=#1] (current page.north west) rectangle
                ($ (current page.south west) + (1cm,0cm) $);
            \fill [color=#1](current page.west) ++(-0.5cm,0cm) circle(2cm);
            \draw [color=white](current page.west) ++(0.75cm,0cm) node {\Large#2};
            \draw [color=white](current page.north west) ++(+0.5cm,-0.5cm) node[rotate=-90,anchor=west] {\smallcaps{#1: #3}};
            \draw [color=white](current page.south west) ++(+0.5cm,+0.5cm) node[rotate=-90,anchor=east] {\smallcaps{Version: #4}};
            \draw [color=#1](current page.south east) ++(-0.5cm,+0.5cm) node[anchor=south east] {\href{#5}{\qrcode{#5}}};
        \end{tikzpicture} 
        } 
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{card}  
\section[#3]{{\rmfamily\Huge\itshape\color{\cardtype}#3}} 
\label{#2}
\setcounter{footnote}{0} 
\setcounter{figure}{0} 
\setcounter{table}{0} 
} 

% End of file
\endinput
