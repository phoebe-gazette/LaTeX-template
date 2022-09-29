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
% See ... for a user guide
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
% This work consists of all the files listed in readme.txt

\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{phoebe}[2022/09/12 v0.1 phoebe class]

\newcommand{\phoebe}{\raisebox{0.2em}{$\varphi$}h\oe{}be}

\PassOptionsToPackage{fleqn}{amsmath} 
\LoadClass[%
  paper        = a4,	   	   	% select paper size
  fontsize     = 11pt,		   	% font size
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
    largesmallcaps,
    nosf
    ]{kpfonts}
%\usepackage{newpxtext}
%\RequirePackage{libertine}

% language/hyphenation
\RequirePackage[ngerman,english]{babel}   
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



%\setmainfont{MinionPro-Regular.otf}[
%    BoldFont = MinionPro-Bold.otf ,
%    ItalicFont = MinionPro-It.otf ,
%    BoldItalicFont = MinionPro-BoldIt.otf ]


\KOMAoptions{DIV=calc}   % recalculate Satzspiegel with new font


% colors
\RequirePackage[table]{xcolor} 			% specifying colors 

% some nice colors
\definecolor{uhdred}{RGB}{197, 13, 41}
\definecolor{darkred}{RGB}{90, 15, 20}
\definecolor{sand}{RGB}{245, 240, 234}

%--------------------------------------------------------------
% 2. Title
%--------------------------------------------------------------

%\renewcommand{\maketitle}{}


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
% 6. Math related packages and new commands
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
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
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
% 8. bibliography and references
%--------------------------------------------------------------
	           
% maxnames: if more authors than is truncated to minnames
\RequirePackage[
                backend=biber,
                style=biblatex-mnras,
                hyperref=true,
                ]{biblatex}
                
\RequirePackage{hyperref}			% for links and references

\hypersetup{				% setup the hyperref-package options
	plainpages=false,		% 	-
	linktoc=page,			%	- 
	colorlinks=true,		% 	- colorize links?
	linkcolor=blue,	        %	-
    citecolor=blue,         % 	-
    urlcolor=magenta,		%	-
	pdfborder={0 0 0},		% 	-
	breaklinks=true,			% 	- allow line break inside links
	bookmarksnumbered=true,	%
	bookmarksopen=true,		%
	bookmarksdepth=2
}


%--------------------------------------------------------------
% 9. Header and Footer
%--------------------------------------------------------------

\usepackage{scrlayer-scrpage}

\lehead[\pagemark]{\pagemark\quad{\itshape\runauthor}}
\rohead[\upshape \textsc{doi}: \href{http://dx.doi.org/\doinum}{\doinum}]{{\itshape\runtitle}\quad\pagemark}
\cohead[\upshape \thepubdate]{}
\lohead[\upshape \href{www.phoebe-gazette.de}{\phoebe}]{}

\lefoot[]{}
\rofoot[\pagemark]{}


%--------------------------------------------------------------
% 10. Commands for the title
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

\date{}
	
\newcommand\doi[1]{\def\doinum{#1}}
\newcommand\pubdate[1]{\def\thepubdate{#1}}

\newcommand{\defabstract}[1]{\newcommand\abstracttext{#1}}

\renewcommand\maketitle{
\twocolumn[
  \oldmaketitle
  \begin{@twocolumnfalse}
  \begin{abstract}
    \addsec*{Abstract}
    \abstracttext
  \end{abstract}
  \end{@twocolumnfalse}
]}



%--------------------------------------------------------------
% Change log
%--------------------------------------------------------------

%    Original file produced by Fabian Scheuermann (2022)
%
% v0.1     First version
%
% end of phoebe.cls