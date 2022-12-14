% phoebe.cls
%
% Phoebe gazette document class file
% v0.1 for LaTeX 2e
%
% Copyright (C) Fabian Scheuermann,
%
% Authors:
% Fabian Scheuermann
%
% For a full change log see the end of this file.
%
% Contents
% 1. Basics
% 2. Title
% 3. Headings
% 4. Various packages for math, floats, etc.
% 5. Bibliography and references
% 6. Header and Footer
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `author-maintained'.
% 
% The Current Maintainer of this work is: Fabian Scheuermann,
% who can be contacted on f.scheuermann@uni-heidelberg.de
%

%--------------------------------------------------------------
% Load parent class
%--------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{phoebe}[2022/09/23 v0.1 phoebe class]

\newcommand{\phoebe}{\raisebox{0.2em}{$\varphi$}h\oe{}be}
\renewcommand{\phoebe}{Ph\oe{}be}

\PassOptionsToPackage{fleqn}{amsmath} 
\LoadClass[%
  paper        = a4,	   	   	% select paper size
  fontsize     = 10pt,		   	% font size
  BCOR         = 0mm,		   	% add space for binding
  twoside      = true,			% oneside or twoside printing
  twocolumn    = true,
  DIV          = calc,		   	% calculate type area
  headinclude  = false,         % header not part of text area
  footinclude  = false,         % footer not part of text area
  %footheight   = 2cm,
  %headheight   = 4cm,
  open         = right,	   		% cleardouble ends up right side           
  bibliography = leveldown,   	% no pagebreak befor bibliography
  numbers      = noenddot,		% no period after numbers (2.1.)
  titlepage    = false
]{scrartcl}

%--------------------------------------------------------------
% 0. Load options
%--------------------------------------------------------------

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}

\newcommand*\phoebe@language{ngerman}
\newcommand*\phoebe@citestyle{}
\newcommand*\phoebe@bibstyle{}

\pgfkeys{
    phoebe/.cd ,
    language/.code = \renewcommand*\phoebe@language{#1} ,
    language/.default = ngerman ,
    citestyle/.default =biblatex-mnras,
    citestyle/.code = \@phoebe@citestyle ,
    bibstyle/.default =biblatex-mnras,
    bibstyle/.code = \@phoebe@bibstyle 
}

\ProcessPgfOptions{/phoebe}

%--------------------------------------------------------------
% 1. Basics
%--------------------------------------------------------------

% prevent Widows and orphans under all circumstances
\clubpenalty = 100000
\widowpenalty = 200000
\displaywidowpenalty = 200000

\linespread{1.07}        % increaes Durchschuss

% encoding
\RequirePackage[utf8]{inputenc} 	    % letters with accents
\RequirePackage[T1]{fontenc} 			% Use 8-bit encoding 

% font package for sans serif
%\RequirePackage{charter}	
% we use kpfonts(similar to Palatino)
\RequirePackage[
    oldstylenums,
    oldstyle,
    largesmallcaps,
    uprightgreeks
    ]{kpfonts}
%\usepackage{newpxtext}
%\RequirePackage{libertine}

% language/hyphenation
\RequirePackage[\phoebe@language]{babel}   
\RequirePackage{csquotes}
% hyphenation words with a dash (use \-/)
\usepackage[shortcuts]{extdash}

% for microtypographie (e.g. adjust spacing in small caps)
% http://www.khirevich.com/latex/microtype/
\usepackage[ 
  activate={true,nocompatibility},
  final,
  kerning=true,
  factor=1100,
  stretch=10,
  shrink=10,
  letterspace=80,
]{microtype}

\KOMAoptions{DIV=calc}   % recalculate Satzspiegel with new font

% colors
\RequirePackage[table]{xcolor} 			% specifying colors 

% use the corporate design colors of Heidelberg University
\definecolor{uhdred}{RGB}{197, 13, 41}
\definecolor{darkred}{RGB}{90, 15, 20}
\definecolor{sand}{RGB}{245, 240, 234}
\definecolor{linkblue}{RGB}{78, 121, 167}
\definecolor{citegreen}{RGB}{89, 161, 78}
\definecolor{refred}{RGB}{225, 87, 89}

% balance the columns on the last page
\usepackage{flushend}

%--------------------------------------------------------------
% 2. Title
%--------------------------------------------------------------


\let\oldtitle\title
\let\oldauthor\author 
\let\oldmaketitle\maketitle 
\let\oldabstract\abstract 

\RequirePackage{ifthen}

\renewcommand\title[2][]{\ifthenelse{\equal{#1}{}}%
	{%
	\def\maintitle{#2}
	\def\runtitle{#2}
	\title{#2}
	}%
	{%
	\def\maintitle{#2}
	\def\runtitle{#1}
	\oldtitle{#2}
	}
	}
	
\renewcommand\author[2][]{\ifthenelse{\equal{#1}{}}%
	{%
	\def\mainauthor{#2}
	\def\runauthor{#2}
	\author{#2}
	}%
	{%
	\def\mainauthor{#2}
    \def\runauthor{#1}
	\oldauthor{#2}
	}
	}

% 
% the following code is copied from the MNRAS style
% 

\newskip\@indentskip
\newskip\smallindent
\newskip\@footindent
\newskip\@leftskip
\@indentskip=18pt
\smallindent=1.5em
\@footindent=\smallindent
\@leftskip=\z@

\setlength\leftmargini{   \z@ }
\setlength\leftmarginii{  1em }
\setlength\leftmarginiii{ 1em }
\setlength\leftmarginiv{  1em }
\setlength\leftmarginv{  1pc }
\setlength\leftmarginvi{  1pc }
\setlength\leftmargin{\leftmargini}
\setlength\labelsep{ 0.5em}
\labelwidth\leftmargini\advance\labelwidth-\labelsep

\def\maketitle{\par
 \begingroup
  \if@twocolumn
   \twocolumn[\vspace*{2.5em}\@maketitle]
  \else
   \newpage
   \global\@topnum\z@
   \@maketitle
  \fi
  %\thispagestyle{titlepage}
 \endgroup
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@author{}
 \gdef\@title{}
 \let\thanks\relax
}
\def\newauthor{%                       DE's definitions
  \end{tabular}\par
  \begin{tabular}[t]{@{}l@{}}\let\\=\author@nextline%
}
\def\and{%
  \end{tabular}\vskip 3pt\par
  \begin{tabular}[t]{@{}l@{}}\let\\=\author@nextline%
}
\def\@maketitle{\newpage
 \vspace*{7pt}
 {\raggedright \sloppy
  {\centering\reset@font\huge \@title \par}
  \vskip 2em
  {\reset@font\Large
   \begin{tabular}[t]{@{}l@{}}\let\\=\author@nextline\@author
   \end{tabular}
   \par}
  \vskip 1.em
 }                          %End of DE's definitions
 \par\noindent
 {\reset@font\small \@date \par}
 \vskip 2em
}

\def\author@nextline{          %DE's definition
\tabularnewline[-7pt]\reset@font\scriptsize\itshape\ignorespaces
\let\\=\author@nextline}       %let command added by NT to bring
                               % subsequent lines into correct format

\def\abstract{\if@twocolumn
   \start@SFBbox\@abstract
 \else
   \@abstract
 \fi}
\def\endabstract{\if@twocolumn
   \endlist\finish@SFBbox
 \else
  \endlist
 \fi}
\def\@abstract{\list{}{%
    \listparindent
    \itemindent\z@
    \labelwidth\z@ \labelsep\z@
    \leftmargin \rightmargin\z@
    \parsep 0pt plus 1pt}\item[]%
    \addsec*{Abstract}
} % SFB 0.1.01

%
\newif\ifSFB@keywords
\def\keywords{\if@twocolumn
  \start@SFBbox\@keywords
 \else
 \par\noindent
 {\reset@font\small \@keywords \par}
 \fi
}
\def\@keywords{\list{}{%
    \labelwidth\z@ \labelsep\z@
    \leftmargin 11pc\rightmargin\z@  % was 11pc\right....
    \parsep 0pt plus 1pt}\item[]\reset@font{\scshape keywords: }%
}
\def\endkeywords{\if@twocolumn
  \endlist\addvspace{2em plus 0.5\baselineskip}\finish@SFBbox
 \else
  \endlist
 \fi
 \@thanks
 \gdef\@thanks{}
 \SFB@keywordstrue
}
\def\nokeywords{\ifSFB@keywords\else
 \if@twocolumn \start@SFBbox\addvspace{37pt}\finish@SFBbox \fi
 \@thanks
 \gdef\@thanks{}\fi
}

\def\author@tabular{\def\@halignto{}\@authortable}
\let\endauthor@tabular=\endtabular
%
\def\author@tabcrone{\vspace{2pt}{\ifnum0=`}\fi%
  \@xtabularcr[-7pt]\reset@font\small\it
  \let\\=\author@tabcrtwo\ignorespaces}
%
\def\author@tabcrtwo{{\ifnum0=`}\fi\@xtabularcr[-7pt]\reset@font\small\it
 \let\\=\author@tabcrtwo\ignorespaces}
%
\def\@authortable{\leavevmode \hbox \bgroup $\let\@acol\@tabacol
 \let\@classz\@tabclassz \let\@classiv\@tabclassiv
 \let\\=\author@tabcrone\ignorespaces \@tabarray}

\def\start@SFBbox{\@next\@currbox\@freelist{}{}%
 \global\setbox\@currbox
 \vbox\bgroup
  \hsize \textwidth
  \@parboxrestore
}
\def\finish@SFBbox{\par\vskip -\dbltextfloatsep
  \egroup
  \global\count\@currbox\tw@
  \global\@dbltopnum\@ne
  \global\@dbltoproom\maxdimen\@addtodblcol
  \global\vsize\@colht
  \global\@colroom\@colht
}

% and some additional variables
	
\newcommand\doi[1][]{\ifthenelse{\equal{#1}{}}{%
\def\thedoi{please insert \textsc{doi}}%
}{%
\def\thedoi{\textsc{doi}: \href{http://dx.doi.org/#1}{#1}}%
}}

%\newcommand\email[1][]{\ifthenelse{\equal{#1}{}}{%
%\def\theemail{corresponding author}%
%}{\def\theemail{#1}}
\newcommand{\email}[1]{\def\theemail{#1}}

\newcommand\pubdate[1]{\def\thepubdate{#1}}

%--------------------------------------------------------------
% 3. headings (part, chapter, section etc.)
%--------------------------------------------------------------

% font for all headings 
\setkomafont{section}{\centering\large\scshape\lsstyle\lowercase}
\setkomafont{subsection}{\centering\large\itshape}
\setkomafont{disposition}{\rmfamily\normalfont}

% this is for the colored version
%\setkomafont{section}{\sffamily\color{uhdred}\bfseries\centering\large}
%\setkomafont{subsection}{\color{uhdred}\bfseries\centering\large\itshape}
%\setkomafont{disposition}{\rmfamily\normalfont}

%--------------------------------------------------------------
% 4. Various packages for math, floats, etc.
%--------------------------------------------------------------

\RequirePackage[fleqn]{amsmath}
\setlength\mathindent{15pt}

\RequirePackage{amsfonts,amssymb}    

% package for units 
\RequirePackage{siunitx}

\sisetup{%
    per-mode=reciprocal,
	exponent-product = \cdot ,
	inter-unit-product = {\;},
	range-units = single,
	separate-uncertainty = true,
    uncertainty-separator =  {\,}, 
	multi-part-units=single}
	
\RequirePackage{graphicx}    	% including pictures

\RequirePackage{listings}       % include source code
 
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    language=[LaTeX]TeX,
    backgroundcolor=\color{sand},   
    commentstyle=\color{citegreen},
    keywordstyle=\color{uhdred},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    %numbers=left,                    
    %numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstset{style=mystyle}
 
\RequirePackage[font=small,labelfont={sc,color=black},hypcap=false]{caption}


% alternatively: justification=raggedright,format=plain
% position in KOMA is controled by tablecaptionsabove
\captionsetup[figure]{
  name=figure,
  position=below,               % tell caption where to insert skip
  justification=justified,      % left aligned
  singlelinecheck=false,        % even left aligned if only one line
  format=hang                   % 
}

\captionsetup[table]{
  name=table,
  position=above,               % tell caption where to insert skip
  justification=justified,      % left aligned
  singlelinecheck=false,        % even left aligned if only one line
  format=hang,                  % 
  belowskip=10pt                % extra space between table and caption
}

% tables
\RequirePackage{booktabs,		% nicer tables
	            multirow,		% multiple rows in table
	            array			% create special columns 	
	           }      
	           
%--------------------------------------------------------------
% 5. bibliography and references
%--------------------------------------------------------------
	           
% maxnames: if more authors than is truncated to minnames
\RequirePackage[
                backend=biber,
                style=biblatex-mnras,
                hyperref=true,
                natbib=true
                ]{biblatex}
                
\RequirePackage{hyperref}			% for links and references

\hypersetup{				% setup the hyperref-package options
	plainpages=false,		% 	-
	linktoc=page,			%	- 
	colorlinks=true,		% 	- colorize links?
	linkcolor=linkblue,	    %	-
    citecolor=citegreen,    % 	-
    urlcolor=refred,		%	-
	pdfborder={0 0 0},		% 	-
	breaklinks=true,			% 	- allow line break inside links
	bookmarksnumbered=true,	%
	bookmarksopen=true,		%
	bookmarksdepth=2
}


%--------------------------------------------------------------
% 6. Header and Footer
%--------------------------------------------------------------


\usepackage{scrlayer-scrpage}

\lehead[\pagemark]{\pagemark\quad{\itshape\runauthor}}
\rohead[\upshape \thedoi]{{\itshape\runtitle}\quad\pagemark}
\cohead[\upshape \thepubdate]{}
\lohead[\upshape \href{www.phoebe-gazette.de}{\phoebe-Gazette}]{}

\lefoot[]{}
\rofoot[\pagemark]{}
\lofoot[\footnotesize\upshape ${}^\dag$ E-mail: \href{mailto:\theemail}{\theemail}]{}

%--------------------------------------------------------------
% others
%--------------------------------------------------------------

\def\bsp{\vspace{0.5cm}\reset@font\footnotesize\noindent This paper
has been typeset from a \TeX/\LaTeX\ file prepared by the author.}

%--------------------------------------------------------------
% Change log
%--------------------------------------------------------------

%    Original file produced by Fabian Scheuermann (2022)
%
% v0.1     First version
%
% end of phoebe.cls
