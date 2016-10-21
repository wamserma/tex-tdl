%% Copyright (c) 2016 Markus Wamser 
%% https://github.com/wamserma/tex-tdl
%%
%% This file may be distributed under the terms of the LaTeX Project Public
%% License (LPPL), as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.1 or, at your option, any later version.
%%
%% The latest version of this license is in
%%          http://www.latex-project.org/lppl.txt
%%
%% LPPL Version 1.1 or later is part of all distributions of LaTeX
%% version 1999/06/01 or later.

%% Class identification
%% ====================
\NeedsTeXFormat{LaTeX2e}[2001/06/01]%
\ProvidesClass{tdl}[2016/10/20 A style for generating ToDo-Managers]%
\typeout{tdl - A week-based Template for paper-based ToDo-Lists}

%% Load other Packages
%% ===================
%Fonts
\RequirePackage[T1]{fontenc}[2005/09/27] % echte Umlaute ausgeben
\RequirePackage{tgheros}[2009/09/27]
\renewcommand{\familydefault}{\sfdefault}

\newcommand{\tdl@start}{\setdatetoday}
\input{config}

%% Declare Options
%% ===============
%Document encoding
\let\@docencoding\@empty
\DeclareOption{ansinew}{\def\@docencoding{ansinew}}
\DeclareOption{applemac}{\def\@docencoding{applemac}}
\DeclareOption{ascii}{\def\@docencoding{ascii}}
\DeclareOption{cp1250}{\def\@docencoding{cp1250}}
\DeclareOption{cp1252}{\def\@docencoding{cp1252}}
\DeclareOption{cp437de}{\def\@docencoding{cp437de}}
\DeclareOption{cp437}{\def\@docencoding{cp437}}
\DeclareOption{cp850}{\def\@docencoding{cp850}}
\DeclareOption{cp852}{\def\@docencoding{cp852}}
\DeclareOption{cp865}{\def\@docencoding{cp865}}
\DeclareOption{decmulti}{\def\@docencoding{decmulti}}
\DeclareOption{latin1}{\def\@docencoding{latin1}}
\DeclareOption{latin2}{\def\@docencoding{latin2}}
\DeclareOption{latin3}{\def\@docencoding{latin3}}
\DeclareOption{latin4}{\def\@docencoding{latin4}}
\DeclareOption{latin5}{\def\@docencoding{latin5}}
\DeclareOption{latin9}{\def\@docencoding{latin9}}
\DeclareOption{next}{\def\@docencoding{next}}
\DeclareOption{utf8}{\def\@docencoding{utf8}}
\def\@docencoding{latin1}

%colored subheadings
\let\@headingcolor\@empty
\DeclareOption{coloredheadings}{\def\@headingcolor{blau301}}
\def\@headingcolor{black!50}

%onepage or twopage
\let\@pagedness\@empty
\DeclareOption{oneside}{\def\@pagedness{oneside}}
\DeclareOption{twoside}{\def\@pagedness{twoside}}
\def\@pagedness{oneside}


%pass undefined options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions

%% Load basic class and hand over unknown options
%% ==============================================

\LoadClass[BCOR=1cm,fontsize=11pt, a4paper, \@pagedness, DIV=11]{scrreprt}[2010/09/17]

%% Load more packages based on options
%% ===================================
\ifx \@docencoding\empty \else
\RequirePackage[\@docencoding]{inputenc}[2008/03/30]
\fi
\RequirePackage[\tdl@texlang]{babel}[2008/07/08]
\RequirePackage[final,babel]{microtype}[2010/01/10]
\RequirePackage{wasysym}[2003/10/30]
\RequirePackage[usenames]{color}[2005/11/14]
\RequirePackage{ifthen}[2001/05/26]
\RequirePackage{tikz}[2010/10/13]
\RequirePackage{datenumber}[2001/08/06]
\input{calendarweek}
\input{strings/\tdl@lang}

%% Declare Font usage
%% ==================

%\fontsize{9pt}{13pt}\selectfont
\fontsize{11pt}{15pt}\selectfont

%% Adjust style
%% ============

%Blau
\definecolor{blau}{cmyk}{1,0.43,0,0} % pantone 300 
\definecolor{blaulight}{cmyk}{0.42,0.09,0,0} % pantone 238 
\definecolor{blaudark}{cmyk}{1.00,0.57,0.12,0.7} % pantone 540 
\definecolor{blau301}{cmyk}{1.00,0.54,0.04,0.19} % pantone 301 

%Akzentfarben
\definecolor{gruen}{cmyk}{0.35,0,1,0.2} % pantone 383 
\definecolor{orange}{cmyk}{0.0,0.65,0.95,0} % pantone 158 
\definecolor{elfenbein}{cmyk}{0.03,0.04,0.14,0.08} % pantone 7527 

\setlength{\parindent}{0pt}

\pagestyle{empty}


%% Define new commands
%% ===================


\tdl@start
\setdatebynumber{\numexpr\value{datenumber}-\value{datedayname}+1} % adjust for beginning of week

\usetikzlibrary{arrows, decorations.markings,shapes,arrows,fit}
\tikzset{bigbox/.style={fill=blaulight!50,draw, inner sep=10pt,label={[tikz@label@post/.append style={anchor=north west}]north west:\fontsize{14}{18}\selectfont\color{black!50}\textbf{#1}}},%
         smallbox/.style={fill=white,anchor=north west,draw,inner sep=3mm,label={[tikz@label@post/.append style={anchor=north west}]north west:\fontsize{10}{14}\selectfont\color{black!50}\textbf{#1}}}}

\newcommand{\daybox}{
	\begin{tikzpicture}[remember picture,overlay]
	\coordinate (dbnw) at ([xshift=10mm, yshift=-10mm] current page.north west);			
    \node[bigbox=\tdl@immediate,anchor=north west,minimum width=95mm,minimum height=157mm] (daybox) at (dbnw) {};
	\node[smallbox=Mo,minimum width=95mm,text width=89mm,minimum height=25mm] (Mo) at ([xshift=0mm, yshift=-7mm] dbnw) {~\\[1mm]$\Box$\\[1mm]$\Box$\\[1mm]$\Box$};
	\node[smallbox=Di,minimum width=95mm,text width=89mm,minimum height=25mm] (Di) at (Mo.south west) {~\\[1mm]$\Box$\\[1mm]$\Box$\\[1mm]$\Box$};
	\node[smallbox=Mi,minimum width=95mm,text width=89mm,minimum height=25mm] (Mi) at (Di.south west) {~\\[1mm]$\Box$\\[1mm]$\Box$\\[1mm]$\Box$};
	\node[smallbox=Do,minimum width=95mm,text width=89mm,minimum height=25mm] (Do) at (Mi.south west) {~\\[1mm]$\Box$\\[1mm]$\Box$\\[1mm]$\Box$};
	\node[smallbox=Fr,minimum width=95mm,text width=89mm,minimum height=25mm] (Fr) at (Do.south west) {~\\[1mm]$\Box$\\[1mm]$\Box$\\[1mm]$\Box$};
	\node[smallbox={Sa/So},minimum width=95mm,text width=89mm,minimum height=25mm] (Sa) at (Fr.south west) {~\\[1mm]$\Box$\\[1mm]$\Box$\\[1mm]$\Box$};
	\end{tikzpicture}
} 

\newcommand{\goalbox}{
	\begin{tikzpicture}[remember picture,overlay]
	\coordinate (dbne) at ([xshift=-10mm, yshift=-30mm] current page.north east);			
    \node[bigbox=\tdl@goal,anchor=north east,minimum width=80mm,minimum height=67mm] (goalbox) at (dbne) {};
	\node[smallbox={},minimum width=80mm,text width=74mm,anchor=south west,minimum height=20mm] (g1) at (goalbox.south west) {$\Box$};
	\node[smallbox={},minimum width=80mm,text width=74mm,anchor=south west,minimum height=20mm] (g2) at (g1.north west) {$\Box$};
	\node[smallbox={},minimum width=80mm,text width=74mm,anchor=south west,minimum height=20mm] (g3) at (g2.north west) {$\Box$};
	\end{tikzpicture}
} 

\newcommand{\notebox}{
	\begin{tikzpicture}[remember picture,overlay]
    \node[bigbox=\tdl@notes,anchor=north east,minimum width=80mm,minimum height=50mm,fill=white] (notebox) at ([xshift=0mm,yshift=-88mm]dbne) {};
	\end{tikzpicture}
} 

\newcommand{\weekbox}{
	\begin{tikzpicture}[remember picture,overlay]
	\coordinate (dbsw) at ([xshift=0mm, yshift=-10mm] daybox.south west);			
    \node[bigbox=\tdl@urgent,anchor=north west,minimum width=190mm,minimum height=100mm,fill=white] (weekbox) at (dbsw) {};
	\end{tikzpicture}
} 

\newcommand{\backbox}{
	\begin{tikzpicture}[remember picture,overlay]
    \node[bigbox=\tdl@backlog,anchor=north west,minimum width=190mm,minimum height=270mm,fill=white] at ([xshift=10mm, yshift=-10mm] current page.north west) {};
	\end{tikzpicture}
} 

\AtBeginDocument{%
\foreach \n[evaluate=\n as \m using {Mod(\n,4)}]  \n in {1,...,52}{
	\begin{tikzpicture}[remember picture,overlay]
	\node[rotate=0,scale=1,text opacity=1,anchor=north east] at ([xshift=-10mm, yshift=-10mm] current page.north east) {\parbox{80mm}{ %
	  \raggedleft\fontsize{14}{18}\selectfont\textbf{KW \calendarweek{\thedateday}{\thedatemonth}{\thedateyear}}\\%
		\fontsize{11}{15}\selectfont\textit{\datedate{}~--~\setdatebynumber{\numexpr\value{datenumber}+7}\datedate\nextdate} %
		} % parbox
	};
	\end{tikzpicture}
	
	\daybox{}
    \goalbox{}	
    \notebox{}	
	\weekbox{}
	\clearpage
	
	\ifthenelse{\equal{\m}{0.0}}{\backbox\clearpage}{\relax}

} % foreach
}

\endinput
