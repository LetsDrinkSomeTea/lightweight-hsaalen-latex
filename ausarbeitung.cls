%%-*- LaTeX -*-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ausarbeitung.cls
%
% Klassendatei fuer Projektarbeiten, Bachelorarbeiten, Masterarbeiten, Praxisberichte
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:			ausarbeitung.cls
% Author:			Ulrich Klauck, Manuel Blum (HTW Aalen)
% Credits to:		Matthias Müller <matthias.mueller@htw-aalen.de>, Prof. Schiefer
% Modifiied by:		Sebastian Stigler    
% Date:			2008/12/4
% Last Rev.:		2016/12/01
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Identify the class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ausarbeitung}[2008/07/02 Ausarbeitung HS Aalen]

\PassOptionsToClass{%
	12pt, % Schriftgröße [10pt, 11pt, 12pt]
	a4paper, % Papierformat [a4paper, a5paper, b5paper, letterpaper, legalpaper]
	onecolumn, % Ein- oder zweispaltig [onecolumn, twocolumn]
	final, % Entwurf oder finale Version [draft, final]
	ngerman, % neue deutsche Rechtschreibung
	reqno, % Nummer bei Formeln links statt rechts [leqno, reqno]
	fleqn, % Formeln linksbündig [fleqn]
	twoside, % ein- oder zweiseitig [oneside, twoside]
	openright, % wo Kapitel beginnen [openright, openany]
	parskip=2ex   % half*,
	headings=big,
	listof=totoc,
}{scrbook}

% Default option---pass to scrbook.cls, since that is the base.
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{scrbook}%
}

\ProcessOptions\relax

% Load the base class and required packages.
\LoadClassWithOptions{scrbook}

% ---------------------------------------------------------------------------------

\RequirePackage{polyglossia}
\setdefaultlanguage{ngerman}
\RequirePackage[german=quotes]{csquotes}
\RequirePackage{pdfpages}

\RequirePackage{fontspec}
\setmainfont{Latin Modern Roman}

\RequirePackage{microtype}


\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage{calc}
\RequirePackage{array}
\RequirePackage{setspace}  

\RequirePackage{blindtext}  
  
\RequirePackage{placeins}
\RequirePackage{float}
\RequirePackage[final,colorlinks=true,citecolor=blue,linkcolor=black]{hyperref}
% --- Ende der zu überprüfenden Liste
% ----------------------------------------------

% Grafik

\RequirePackage{graphicx}
\RequirePackage{pgf}
\RequirePackage{caption}
\RequirePackage{subcaption}


% Mathe

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage{siunitx}

% Algorithmen und Quellcode

\RequirePackage[formats]{listings}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{struktex}
\RequirePackage{filecontents}
\RequirePackage{forloop}
\RequirePackage{ifthen}
\RequirePackage{cancel}

% Tabellen

\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{booktabs}

% Ein paar Symbole
\RequirePackage{textcomp}
\RequirePackage{gensymb}
\RequirePackage{newunicodechar}
%\newunicodechar{°}{\degree}
\RequirePackage{marvosym}

% Indizes
\RequirePackage{makeidx}\makeindex
\RequirePackage[withpage, printonlyused]{acronym}

% Literaturverzeichnis
\PassOptionsToPackage{toc=bib}{biblatex}
\usepackage[%
            style=numeric,%
            %style=alphabetic,%
            %style=authoryear,%
            %style=authortitle,%
            %style=verbose,%
            %style=draft,%
            %%
            %autocite=plain,%
            %autocite=inline,%
            %autocite=footnote,%
            %autocite=supercript,%
            backend=biber
            ]{biblatex}
% Verzeichnisse Automatisch ins Inhaltsverzeichnis:
%\RequirePackage[chapter]{tocbibind}
%---------------------------------------------------------------------------------

\lstloadlanguages{R,Java,Python,[ISO]C++,[ANSI]C++,[ANSI]C}
\RequirePackage{xcolor}
\definecolor{commentgreen}{RGB}{2,112,10}
\definecolor{eminence}{RGB}{108,48,130}
\definecolor{weborange}{RGB}{255,165,0}
\definecolor{frenchplum}{RGB}{129,20,83}

\lstset{
	inputencoding=utf8,
	extendedchars=\true,
%
	numbers=left,
	frame=tb,
	tabsize=2,
%
	captionpos=b,
	breaklines=true,
	breakatwhitespace=true,
	%prebreak=\raisebox{0ex}[0ex][0ex]{\color{gray}\ensuremath{\rhookswarrow}},
	%postbreak=\raisebox{0ex}[0ex][0ex]{\color{gray}\ensuremath{\rcurvearrowse\space}},
%
	xleftmargin=4ex,
	xrightmargin=0ex,
%
	showtabs=false,
	showspaces=false,
	showstringspaces=false,
%
	basicstyle=\ttfamily\color{black}\small,
	keywordstyle=\color{eminence},
	stringstyle=\color{red},
	commentstyle=\color{commentgreen},
	numberstyle=\color{gray},
	identifierstyle=\color{black},
	emphstyle=\color{blue},
	emph={int,char,double,float,unsigned,void,bool},
	%directivestyle=\ttfamily\color{red},
    keywordstyle=[2]{\color{weborange}},
    otherkeywords={>,<,.,;,-,!,=,~},
    morekeywords=[2]{>,<,.,;,-,!,=,~},
%
	literate={%
		{Ö}{{\"O}}1 
		{Ä}{{\"A}}1 
		{Ü}{{\"U}}1 
		{ß}{{\ss}}2 
		{ü}{{\"u}}1 
		{ä}{{\"a}}1 
		{ö}{{\"o}}1
		}
}

\lstdefinelanguage{R}{% https://stat.ethz.ch/pipermail/r-help/2006-September/113688.html
	morekeywords=[1]{\<<-},%
	sensitive=false,
	morecomment=[l]{\#},
	morecomment=[s]{/*}{*/},
	morestring=[b]",
}[keywords,comments,strings]

\lstdefinelanguage{CSS}{
	morekeywords={color,display},
	sensitive=false,
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morestring=[b]",
}

\lstdefinelanguage{C}{%%
%	morekeywords={color,display},
	sensitive=false,
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morestring=[b]"
}


% Error information should be more than the default.
\setcounter{errorcontextlines}{5}


% prepare for listofxxx entrys on demand
\newcounter{acronymctr}
\RequirePackage[figure,lstlisting,table,acronymctr]{xtotalcount}

% ---------------------------------------------------------------------------------
% Pagestyle

\pagestyle{scrheadings} 
\clearscrheadfoot
\ihead{\headmark}
\ohead{\pagemark}
\raggedbottom

%\onehalfspacing % Zeilenabstand: 1,5
\setlength\parskip{2ex}

% Kein Einzug bei neuem Absatz
\setlength{\parindent}{0em}

% ---------------------------------------------------------------------------------
% Titel
\def\@depname{}
\def\depname#1{\def\@depname{#1}}

\newcommand{\setDepname}[1]{\depname{#1}}                   

%\def\@doctype{}%
\newif\ifpsb\psbfalse
\def\doctype#1{\def\@doctype{#1}}%

\newcommand{\setDoctype}[1]{
    \doctype{#1}
    \psbfalse
}

\def\AbgabeDatumTok{\@empty}

%\def\@matrikelnr{}
\def\matrikelnr#1{\def\@matrikelnr{#1}}%
\def\location#1{\def\@location{#1}}%


\renewcommand\maketitle{\begin{titlepage}%
	\sffamily
	\begin{flushright}
		  \includegraphics[width=.75\textwidth]{images/htw-aalen.pdf}%
	\end{flushright}
	\vskip 2cm
	\begin{flushleft}
		\par \large \color{gray}
		\ifx\@doctype\undefined%
%
		\else%
		\@doctype\\%
		Studiengang:\xspace\@depname\xspace\\[0ex]
		\fi%
		\par \rule{\textwidth}{0.25pt}

	\end{flushleft}
%
	\bigskip
	\bigskip
	\bigskip
	\begin{center}
		\ifx\@title\undefined%
		%
		\else
		\par\Huge\textbf{\@title}\bigskip%
		\fi%
		\ifx\@author\undefined%
%
		\else%
		\par \large \color{black}%
		von \par%		
		\Large\@author%
		\fi%
		\ifx\@matrikelnr\undefined%
%
        \else%
        \par\Large \color{gray}%
        \@matrikelnr%
        \fi%
  	\end{center}
	\vfill
%
%
	\begin{tabular}{ll}
	\ifx\@date\undefined
		\else
		& \\
		Einreichungsdatum:			& \@date \\
		\fi
	\end{tabular}
\end{titlepage}
}

% ---------------------------------------------------------------------------------
% Praxisstelle / Eidesstattliche Versicherung


\def\makeaffirmation{%
\chapter{Eidesstattliche Erklärung}
Ich erkläre hiermit, dass ich, \textbf{\@author}, die angegebenen Veranstaltungen des Studium Generale persönlich besucht habe und die vorliegenden Angaben zu den von mir besuchten Veranstaltungen
und sozialen Tätigkeiten wahrheitsgetreu und selbständig verfasst habe.\\
Weiterhin versichere ich, keine anderen als die angegebenen Quellen und Hilfsmittel benutzt zu haben, dass alle Ausführungen, die anderen Schriften wörtlich oder sinngemäß entnommen wurden, kenntlich gemacht sind und dass die Arbeit in gleicher oder ähnlicher Fassung noch nicht Bestandteil einer Studien- oder Prüfungsleistung war.\\[1cm]
  \parbox{\textwidth}{%
     \parbox[b]{7cm}{%
          \textbf{\@location}, den \@date\\[-0.3cm]
          \rule{6cm}{1pt}\\
          Ort, Datum
     }
      \hfill%
      \parbox[b]{7cm}{%
          \@author\\[-0.3cm]\rule{6cm}{1pt}\\Autor%
      }
  }
% \makebox[\textwidth/2]{Ort, Datum} Unterschrift (Student)
}

%-----------------------------------------------------------------------------
\makeatletter
\let\@@latex@@listoffigures\listoffigures
\renewcommand{\listoffigures}{%
 \iftotalfigures%
 \@@latex@@listoffigures%
 \fi%
}
\let\@@latex@@listoftables\listoftables
\renewcommand{\listoftables}{%
  \iftotaltables%
  \@@latex@@listoftables%
  \fi%
}
\let\@@latex@@lstlistoflistings\lstlistoflistings
\renewcommand{\lstlistoflistings}{%
  \iftotallstlistings
  \@@latex@@lstlistoflistings
  \DeEn{%
    \renewcommand{\lstlistingname}{Quelltext}%
    \renewcommand{\lstlistlistingname}{Quelltextverzeichnis}%
    \addcontentsline{toc}{chapter}{Quelltextverzeichnis}%
  }{%
    \renewcommand{\lstlistlistingname}{List of Listings}%
    \addcontentsline{toc}{chapter}{List of Listings}%
  }
  \fi
}
\newcommand{\listoflistings}{\lstlistoflistings}
\newcommand*{\acro}{\stepcounter{acronymctr}\AC@acro}
\makeatother
\newcommand{\listofabbreviations}{%
  \iftotalacronymctrs%
  \chapter*{\DeEn{Abkürzungsverzeichnis}%
                 {List of Abbreviations}}%
  \DeEn{\addcontentsline{toc}{chapter}{Abkürzungsverzeichnis}}%
       {\addcontentsline{toc}{chapter}{List of Abbreviations}}%
  \fi
}
\makeatother

\newenvironment{abstract}{%
  \chapter*{\DeEn{Kurzfassung}%
           {Abstract}}
  \DeEn{\addcontentsline{toc}{chapter}{Kurzfassung}}%
       {\addcontentsline{toc}{chapter}{Abstract}}
}{}
