%	tabhead.sty   coded by Dian Yin
%	Version:	1.0 beta
%	History:	2006.4.24.	I've been working on it for about 3days. Using rotatebox and rule. 
%					However, it cannot place neatly. Now considering using picture.
%					So this version is obsolete.
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tabhead}[2006/4/21 tabheadslash tabheadbackslash headtable env]
\RequirePackage{fp}
\RequirePackage{epsfig}
\makeatletter
\def\vstrut#1#2{\hbox{\vrule height #1 depth #2 width 0pt\relax}}
\def\dimtonum#1#2{\newdimen\tmpdimen\tmpdimen=#1\tab@dimtonum\tmpdimen{#2}}
\def\tab@dimtonum#1#2{\edef#2{\tab@@dimtonum#1}}
\def\tab@@dimtonum#1{\expandafter\tab@@@dimtonum\the#1}
{\catcode`\p=12 \catcode`\t=12 \global\@namedef{tab@@@dimtonum}#1pt{#1}}
\newcommand{\tab@headslash}[5]{%
	\hskip -\tabcolsep
	\dimtonum{#1}\mywidth
	\dimtonum{#2}\myheight
	\dimtonum{#3}\mydepth
	%\FPeval\myrulewidth{root(2, \mywidth *\mywidth + (\myheight + \mydepth)^2)}% but a space is inserted
	\FPadd\myheight{\myheight}{\mydepth}%
	\FPdiv\myangle{\myheight}{\mywidth}%
	\FParctan\myangle{\myangle}%
	\FPdiv\myangle{\myangle}{\FPpi}%
	\FPmul\myangle{\myangle}{180}%
	\FPmul\myheight{\myheight}{\myheight}%
	\FPmul\mywidth{\mywidth}{\mywidth}%
	\FPadd\mywidth{\mywidth}{\myheight}%
	\FProot\myrulewidth{\mywidth}{2}%
	\newbox\tmpa
	\newbox\tmpb
	\setbox\tmpa=\hbox{#4}%
	\setbox\tmpb=\hbox{#5}%
	\copy\tmpa
	\hskip -\wd\tmpa
	\raise -#3\hbox to #1{{\rotatebox{\myangle}{\rule{\myrulewidth 1pt}{\arrayrulewidth}}}}%
	\hskip -\wd\tmpb
	\box\tmpb
	\hskip -\tabcolsep
	\hskip 0pt
}
\newcommand{\tab@headbackslash}[5]{%
	\hskip -\tabcolsep
	\dimtonum{#1}\mywidth
	\dimtonum{#2}\myheight
	\dimtonum{#3}\mydepth
	\FPadd\myheight{\myheight}{\mydepth}%
	\FPdiv\myangle{\myheight}{\mywidth}%
	\FParctan\myangle{\myangle}%
	\FPdiv\myangle{\myangle}{\FPpi}%
	\FPmul\myangle{\myangle}{180}%
	\FPsub\myangle{180}{\myangle}%
	\FPmul\myheight{\myheight}{\myheight}%
	\FPmul\mywidth{\mywidth}{\mywidth}%
	\FPadd\mywidth{\mywidth}{\myheight}%
	\FProot\myrulewidth{\mywidth}{2}%
	\newbox\tmpa
	\newbox\tmpb
	\setbox\tmpa=\hbox{#4}%
	\setbox\tmpb=\hbox{#5}%
	\copy\tmpa
	\hskip -\wd\tmpa
	\raise -#3\hbox to #1{{\rotatebox{\myangle}{\rule{\myrulewidth 1pt}{\arrayrulewidth}}}}%
	\hskip -\wd\tmpb
	\box\tmpb
	\hskip -\tabcolsep
	\hskip 0pt
}
\def\tabheadslash{\noalign{\vskip -0.5\arrayrulewidth}\tab@headslash}
\def\tabheadbackslash{\noalign{\vskip -0.5\arrayrulewidth}\tab@headbackslash}
\makeatother
\newenvironment{headtable}[5]{\begin{tabular}{@{\vstrut{#1}{#2}}>{\hfil}m{#3}*{#4}{@{\hskip
	-\arrayrulewidth}|>{\hfil}m{#5}<{\hfil}}@{\hskip -\arrayrulewidth}}}{\end{tabular}}
\endinput
