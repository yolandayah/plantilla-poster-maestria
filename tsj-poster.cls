% ex: ts=2 sw=2 sts=2 et filetype=tex
% SPDX-License-Identifier: CC-BY-SA-4.0

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tsj-poster}[2026/04/20 v1 TSJ poster format]

 % Declaring options
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{14pt}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{17pt}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{20pt}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{25pt}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{a0paper}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{a1paper}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{a2paper}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{landscape}{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\DeclareOption{portrait}{\PassOptionsToClass{\CurrentOption}{tikzposter}}

\PassOptionsToPackage{T1}{fontenc}
\PassOptionsToPackage{utf8}{inputenc}
\PassOptionsToPackage{spanish,english,activeacute}{babel}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax
\LoadClass{tikzposter}

\RequirePackage{babel}
\RequirePackage{fontenc}
\RequirePackage{graphicx}
\RequirePackage{inputenc}
\RequirePackage{xcolor}

% TSJ Color Definitions
\definecolor{tsjmorado}{rgb}{0.212, 0.063, 0.612}
\definecolor{tsjazul}{rgb}{0.000, 0.553, 1.000}
\definecolor{tsjrojo}{rgb}{1.000, 0.306, 0.392}
\definecolor{tsjverde}{rgb}{0.000, 0.780, 0.541}
\definecolor{tsjamarillo}{rgb}{1.000, 0.675, 0.110}

\definetitlestyle{TSJTitleStyle}{
    width=\paperwidth, roundedcorners=0, linewidth=0pt, innersep=8mm,
    titletotopverticalspace=5mm, titletoblockverticalspace=20mm,
    titlegraphictotitledistance=10pt
}{}

\definecolorpalette{TSJPalette}{
    \definecolor{colorOne}{rgb}{0.000, 0.553, 1.000} % Azul
    \definecolor{colorTwo}{rgb}{0.439, 0.188, 0.627} % Morado
    \definecolor{colorThree}{rgb}{1.000, 0.306, 0.392} % Rojo
}

\definecolorstyle{TSJColorStyle}{
    % Define default colors
    %GreenGrayViolet
    \definecolor{colorOne}{HTML}{A2E2C7}
    \definecolor{colorTwo}{HTML}{56555A}
    \definecolor{colorThree}{HTML}{C9AECF}
}{
     % Background Colors
    \colorlet{backgroundcolor}{colorOne}
    \colorlet{framecolor}{colorOne!50!colorTwo}
    % Title Colors
    \colorlet{titlefgcolor}{colorTwo}
    \colorlet{titlebgcolor}{white}
    % Block Colors
    \colorlet{blocktitlebgcolor}{white}
    \colorlet{blocktitlefgcolor}{colorTwo}
    \colorlet{blockbodybgcolor}{white}
    \colorlet{blockbodyfgcolor}{black}
    % Innerblock Colors
    \colorlet{innerblocktitlebgcolor}{colorThree}
    \colorlet{innerblocktitlefgcolor}{black}
    \colorlet{innerblockbodybgcolor}{white}
    \colorlet{innerblockbodyfgcolor}{black}
    % Note colors
    \colorlet{notefgcolor}{black}
    \colorlet{notebgcolor}{colorThree}
    \colorlet{notefrcolor}{colorThree}
}

\defineblockstyle{TSJBlock}{
    titlewidthscale=1, bodywidthscale=1, titlecenter,
    titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0pt, bodyoffsety=0pt,
    bodyverticalshift=-1.2cm, roundedcorners=0, linewidth=1.2pt,
    titleinnersep=1cm, bodyinnersep=1cm
}{
    \ifBlockHasTitle%
        \coordinate (topright) at (blocktitle.north east);
    \else
        \coordinate (topright) at (blockbody.north east);
    \fi%
    \draw[color=blocktitlefgcolor, fill=blockbodybgcolor,%
	dashed, rounded corners=5pt,
    ] (blockbody.south west) rectangle (topright);%
}

\definelayouttheme{TSJ}{
    \usecolorstyle[colorPalette=TSJPalette]{TSJColorStyle}
    \usebackgroundstyle{Empty}
    \usetitlestyle{TSJTitleStyle} % Empty
    \useblockstyle{TSJBlock}
    \useinnerblockstyle{Default}
    \usenotestyle{Default}
}

% Redefinimos title
\def\title#1{\gdef\@title{#1}}

\settitle{
\noindent
\begin{minipage}{0.20\textwidth}
    \includegraphics[height=0.4\linewidth]{img/tecmm.png}
\end{minipage}
\hfill
\begin{minipage}{0.55\textwidth}
    \centering
    \color{titlefgcolor} 
    {\bfseries \Huge \@title}
\end{minipage}
\hfill
\begin{minipage}{0.20\textwidth}
    \includegraphics[height=0.4\linewidth]{img/tsj.png}
\end{minipage}
\begin{tikzpicture}
    % [draw=color_borde, fill=color_fondo, line width=grosor]
    \node[draw=titlefgcolor, fill=titlefgcolor, text=titlebgcolor,
    minimum width=0.98\paperwidth, minimum height=6em]
    at (0,0) {\textbf{\huge \@author}};
    \node[text=titlebgcolor] at (0,-2.8) {\textbf{\Large \@institute}};
\end{tikzpicture}
}

